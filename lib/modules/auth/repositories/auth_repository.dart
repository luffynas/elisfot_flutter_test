import 'dart:developer';

import 'package:elisoft_flutter_test/api/app_api.dart';
import 'package:elisoft_flutter_test/core/auth_storage.dart';
import 'package:elisoft_flutter_test/exception/app_exception.dart';
import 'package:elisoft_flutter_test/models/base_response.dart';
import 'package:elisoft_flutter_test/models/user.dart';
import 'package:elisoft_flutter_test/repositories/user_repository.dart';

class AuthRepository {
  AuthRepository();

  AuthStorage authStorage = AuthStorage();
  UserRepository userRepository = UserRepository();

  Future<User?> authenticate({
    required String email,
    String? password,
  }) async {
    final session = await Auth.doLogin(email, password!);

    if (session != null) {
      final resp = BaseResponseApp.fromJson(session);

      if (resp.code == 200) {
        log('message :: resp.data ::: ${resp.data}');
        await authStorage.saveToken('lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB');
        final user = User.fromJson(resp.data as Map<String, dynamic>);
        await userRepository.saveUser(user.toJson());
        return user;
      } else {
        throw AppException(message: session['message'] as String);
      }
    } else {
      throw AppException(message: 'Cannot communicate with server');
    }
  }

  Future<BaseResponseApp> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    return Auth.doRegister(fullname, email, password).then((session) async {
      log('sessionsession $session');
      // ignore: unnecessary_null_comparison
      if (session != null) {
        return BaseResponseApp.fromJson(session);
      } else {
        throw AppException(message: 'Cannot communicate with server');
      }
    }).catchError(handleError);
  }

  Future<void> saveToken(String value) async {
    await authStorage.saveToken(value);
  }

  Future<void> saveRefreshToken(String value) async {
    await authStorage.saveRefreshToken(value);
  }

  Future<String?> getToken() async {
    return authStorage.getToken();
  }

  Future<bool> hasToken() async {
    final session = await authStorage.getToken();
    return session != null && session.isNotEmpty;
  }

  Future<void> signOut() async {
    await Auth.doLogout();
  }

  Future<void> clear() async {
    await authStorage.clear();
  }
}
