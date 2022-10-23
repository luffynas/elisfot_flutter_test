class BaseResponseApp {
  int code;
  String message;
  bool status;
  dynamic data;

  BaseResponseApp({
    required this.code,
    required this.message,
    required this.status,
    this.data,
  });

  factory BaseResponseApp.fromJson(Map<String, dynamic> json) =>
      BaseResponseApp(
        code: json['code'] as int,
        message: json['message'] as String,
        status: json['status'] as bool,
        data: json['user'] != null
            ? json['user'] as dynamic
            : json['articles'] as dynamic,
      );
}
