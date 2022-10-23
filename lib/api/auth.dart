import 'dart:developer';

import 'package:elisoft_flutter_test/api/app_api.dart';
import 'package:elisoft_flutter_test/utils/json_helper.dart';

class Auth {
  static Future<Map<String, dynamic>?> doLogin(String email, String password) {
    return ApiClient().public().post('/auth/login', body: {
      'email': email,
      'password': password,
    }).then((resp) {
      final data = tryDecode(resp.body as String);
      log('login data: $data');
      return data;
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> doRegister(
      String fullname, String email, String password) {
    return ApiClient().public().post('/auth/register', body: {
      'fullname': fullname,
      'identifier': email,
      'password': password,
    }).then((resp) {
      final data = tryDecode(resp.body as String);
      log('login data: $data');
      return data; //new Session(data['access_token']);
    }).catchError(handleError);
  }

  static Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> data) {
    return ApiClient()
        .public()
        .post('/reset-password', body: data)
        .then((resp) {
      final data = tryDecode(resp.body as String);
      return data;
    }).catchError(handleError);
  }

  static Future<void> doLogout() {
    return ApiClient().public().post('/logout').then((resp) {
      log('resp: ${resp.body}');
    }).catchError(handleError, test: (_) => true);
  }
}
