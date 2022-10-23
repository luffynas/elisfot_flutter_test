// this code is autogenerated using ansvia-vscode extension.
import 'package:equatable/equatable.dart';

/// Model for Session
class Session extends Equatable {
  const Session({this.token, this.refreshToken, this.googleToken});

  final String? token;
  final String? refreshToken;
  final String? googleToken;

  Map<String, dynamic> toMap() {
    var data = <String, dynamic>{};
    data['access_token'] = token;
    return data;
  }

  static Session fromJson(Map<String, dynamic> data) {
    return Session(
      token: data['access_token'] as String?,
      refreshToken: data['refresh_token'] as String?,
      googleToken: data['google_token'] as String?,
    );
  }

  Session copy({
    String? token,
    String? refreshToken,
    String? googleToken,
  }) {
    return Session(
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      googleToken: googleToken ?? this.googleToken,
    );
  }

  @override
  List<Object?> get props => [token, refreshToken];
}