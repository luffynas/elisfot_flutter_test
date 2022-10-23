class AppException implements Exception {
  AppException({this.message, this.status = 'error', this.statusCode = 200});
  String? message;
  String status;
  int statusCode;

  // ignore: prefer_constructors_over_static_methods
  static AppException fromResp(Map<String, dynamic> data) {
    // No Used assert(data.containsKey('message') in graphql
    assert(
      data.containsKey('message'),
      'invalid error data, no `message` field',
    );

    assert(
      data.containsKey('status_code'),
      'invalid error data, no `status` field',
    );
    return AppException(
      message: data['message'] as String,
      statusCode: data['status_code'] as int,
    );
  }

  /// Set custom error messag
  AppException withMsg(String msg) {
    message = msg;
    return this;
  }

  @override
  String toString() {
    return message!;
  }
}
