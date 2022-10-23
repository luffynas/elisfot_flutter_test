import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:elisoft_flutter_test/exception/app_exception.dart';
import 'package:elisoft_flutter_test/modules/auth/repositories/auth_repository.dart';
import 'package:elisoft_flutter_test/utils/json_helper.dart';
import 'package:elisoft_flutter_test/utils/string_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class ApiClient {
  ApiClient._internal();

  factory ApiClient() => _singleton;
  static final ApiClient _singleton = ApiClient._internal();
  final AuthRepository authRepository = AuthRepository();

  ApiResource private() =>
      ApiResource(dotenv.env['BASE_URL_PRIVATE']!, authRepository);
  ApiResource public() =>
      ApiResource(dotenv.env['BASE_URL_PUBLIC']!, authRepository);
  ApiResource gcs() => ApiResource(dotenv.env['BASE_URL_GCS']!, authRepository);
  ApiResource oss() =>
      ApiResource(dotenv.env['BASE_URL_PUBLIC']!, authRepository);
}

typedef ErrorHandlerFunc = void Function(Object error);

class ApiResource {
  ApiResource(this.baseUrl, this._authRepository);

  final String baseUrl;
  static String? accessToken;
  final AuthRepository _authRepository;
  static ErrorHandlerFunc errorHandler = (err) {};

  static HttpClient getHttpClient() {
    final httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 600);
    // ..badCertificateCallback = ((X509Certificate cert, String host, int port) => trustSelfSigned);

    return httpClient;
  }

  Future<dynamic> post(String apiPath, {Map<String, dynamic>? body}) async {
    try {
      return _post(apiPath, body: body).then((resp) {
        // log("$baseUrl [POST $apiPath] resp: ${resp.body}");
        return resp;
      });
    } catch (e) {
      ApiResource.errorHandler(e);
    }
  }

  Future<dynamic> _post(String apiPath, {Map<String, dynamic>? body}) async {
    final client = http.Client();
    await ensureAccessToken();
    // log("loading get access token: $accessToken");
    try {
      log('wanna to dispatch api at ${baseUrl + apiPath} body: $body');
      final uri = Uri.parse(baseUrl + apiPath);
      return client.post(uri, headers: buildHeaders(), body: json.encode(body));
    } on SocketException catch (e) {
      //print("SocketException. $e");
      throw AppException(
        message:
            'Cannot connect to server, please check your internet connection',
      );
    } finally {
      client.close();
    }
  }

  Future<Map<String, dynamic>> upload(
    String apiPath, {
    required Map<String, dynamic> body,
    OnUploadProgressCallback? onUploadProgress,
  }) async {
    try {
      return _postUpload(
        apiPath,
        body: body,
        onUploadProgress: onUploadProgress,
      ).then((resp) {
        log('[POST $apiPath] resp: $resp');
        return resp;
      });
    } catch (e) {
      log('upload e ${e.toString()}');
      throw AppException(message: e.toString());
    }
  }

  // multipart upload, untuk mendapatkan progress upload yang valid, gunakan `http.MultipartFile.fromPath`
  Future<Map<String, dynamic>> _postUpload(
    String apiPath, {
    required Map<String, dynamic> body,
    OnUploadProgressCallback? onUploadProgress,
  }) async {
    await ensureAccessToken();
    try {
      // log("message :: $body");
      var postUri = Uri.parse(baseUrl + apiPath);

      final field = body['key'] as String;
      final value = body['value'];
      // final kind = body["kind"] as String?;
      var fileNameFinal = "";
      if (body['filename'] != null) {
        final filename = body['filename'] as String;
        final ext = filename.split(".").last;
        fileNameFinal = '${getRandString(25)}.$ext';
      }
      final httpClient = getHttpClient();

      final request = await httpClient.postUrl(postUri);

      int byteCount = 0;
      var requestMultipart = http.MultipartRequest('POST', postUri);

      if (value is String) {
        final ext = p.extension(value);
        fileNameFinal = "${getRandString(25)}$ext";
        log(fileNameFinal);
        final multipart = await http.MultipartFile.fromPath('media[]', value,
            filename: fileNameFinal);
        requestMultipart.files.add(multipart);
      }
      // if (value is Uint8List) {
      //   final multipart =
      //       http.MultipartFile.fromBytes(field, value, filename: fileNameFinal);
      //   requestMultipart.files.add(multipart);
      // }
      // requestMultipart.files.add(http.MultipartFile.fromString('key', 'image'));
      requestMultipart.fields['key'] = field;

      var msStream = requestMultipart.finalize();

      var totalByteLength = requestMultipart.contentLength;

      request.contentLength = totalByteLength;
      final contentTypeHeader =
          requestMultipart.headers[HttpHeaders.contentTypeHeader];
      request.headers.add(HttpHeaders.contentTypeHeader, contentTypeHeader!);
      request.headers.add(HttpHeaders.contentLengthHeader, totalByteLength);
      request.headers.add('Authorization', "Bearer $accessToken");
      //print("== request.headers ${request.headers}");

      // log("message :: upload ${request.headers}");
      // log("message :: upload ${request.contentLength}");
      // requestMultipart.files.forEach((e) {
      //   log("message :: uploadd ${e.field}");
      //   log("message :: uploaddd ${e.filename}");
      //   log("message :: uploaddd $value");
      // });
      // requestMultipart.fields.forEach((key, value) {
      //   log("message :: fields uploadd $key");
      //   log("message :: fields uploaddd $value");
      // });

      Stream<List<int>> streamUpload = msStream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            byteCount += data.length;

            if (onUploadProgress != null) {
              //print("onUploadProgress $byteCount/$totalByteLength");
              onUploadProgress(byteCount, totalByteLength);
              // CALL STATUS CALLBACK;
            }
            sink.add(data);
          },
          handleError: (error, stack, sink) {
            //print("errror upload ${error.toString()}");
            throw error;
          },
          handleDone: (sink) {
            //print("=== handleDone");
            sink.close();
            // UPLOAD DONE;
          },
        ),
      );

      await request.addStream(streamUpload);

      final httpResponse = await request.close();
      var statusCode = httpResponse.statusCode;

      if (statusCode ~/ 100 != 2) {
        throw Exception(
            'Error uploading file, Status code: ${httpResponse.statusCode}');
      } else {
        //print("response $httpResponse");
        //print("httpResponse.statusCode ${httpResponse.statusCode}");
        // var response = await http.Response.fromStream(httpResponse);
        final response = await readResponse(httpResponse);
        // log("message :: upload $response");
        final respData = tryDecode(response);
        // print("response :: $respData");
        return respData;
      }

      // var request = http.MultipartRequest('POST', postUri);

      // request.headers.addAll({'X-Access-Token': accessToken ?? ''});

      // // var fileName = "image_${DateTime.now().millisecondsSinceEpoch}.jpg";

      // //print("fileName $fileName");
      // request.files.add(multipart);

      // var streamedResponse = await request.send();
      // var response = await http.Response.fromStream(streamedResponse);

      // //print("response $response");

      // //print("base url ${this.baseUrl}");
      // return response; //await request.send();
    } on SocketException catch (e) {
      //print("SocketException. $e");
      throw AppException(
        message:
            'Cannot connect to server, please check your internet connection',
      );
    }
  }

  Future<String> readResponse(HttpClientResponse response) async {
    return response.transform(utf8.decoder).join();
  }

  static Future<String> readResponseAsString(HttpClientResponse response) {
    final completer = Completer<String>();
    final contents = StringBuffer();
    response.transform(utf8.decoder).listen(
          contents.write,
          onDone: () => completer.complete(contents.toString()),
        );
    return completer.future;
  }

  Future<dynamic> get(String apiPath) async {
    try {
      return _get(apiPath);
    } catch (e) {
      ApiResource.errorHandler(e);
    }
  }

  Future<dynamic> _get(String apiPath) async {
    final client = http.Client();
    await ensureAccessToken();
    try {
      final uri = Uri.parse(baseUrl + apiPath);
      return client.get(uri, headers: buildHeaders()).then((resp) {
        log('[GET $apiPath] resp: ${resp.body}');
        return resp;
      });
    } on SocketException catch (e) {
      //print("SocketException. $e");
      throw AppException(
        message:
            'Cannot connect to server, please check your internet connection',
      );
    } finally {
      client.close();
    }
  }

  Future<dynamic> delete(String apiPath, {Map<String, dynamic>? body}) async {
    try {
      return _delete(apiPath, body: body).then((resp) {
        log('$baseUrl [DELETE $apiPath] resp: ${resp.body}');
        return resp;
      });
    } catch (e) {
      ApiResource.errorHandler(e);
    }
  }

  Future<dynamic> _delete(String apiPath, {Map<String, dynamic>? body}) async {
    final client = http.Client();
    await ensureAccessToken();
    // print("loading get access token: $accessToken");
    try {
      log('wanna to dispatch api at ${baseUrl + apiPath} body: $body');
      final uri = Uri.parse(baseUrl + apiPath);
      return client.delete(uri,
          headers: buildHeaders(), body: json.encode(body));
    } on SocketException catch (e) {
      //print("SocketException. $e");
      throw AppException(
        message:
            'Cannot connect to server, please check your internet connection',
      );
    } finally {
      client.close();
    }
  }

  Map<String, String>? buildHeaders() {
    return {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
  }

  Future<void> ensureAccessToken() async {
    if (accessToken == null || accessToken == '') {
      accessToken = await _authRepository.getToken();
      // print("loading get access token: $accessToken");
    }
  }
}

/// Handle error in Future or async function.
FutureOr<Map<String, dynamic>> handleError(Object e) {
  try {
    return _handleError(e);
  } catch (e) {
    ApiResource.errorHandler(e);
    throw AppException(message: e.toString());
  }
}

FutureOr<Map<String, dynamic>> _handleError(Object e) {
  if (e is SocketException) {
    //print("SocketException. $e");
    throw AppException(
      message:
          'Cannot connect to server, please check your internet connection',
    );
  } else if (e is http.ClientException) {
    throw AppException(message: 'Cannot contact server');
  } else {
    //print("Unhandled exception during calling Rest API: $e, ${e.runtimeType}");
    throw AppException(message: e.toString());
  }
}
