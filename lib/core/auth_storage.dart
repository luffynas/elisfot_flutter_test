import 'dart:async';

import 'package:get_storage/get_storage.dart';

class AuthStorage {
  final storageName = 'token';
  final storageRefreshToken = 'refresh_token';

  Future<AuthStorage> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> saveToken(String value) async {
    await GetStorage().write(storageName, value);
  }

  Future<void> saveRefreshToken(String value) async {
    await GetStorage().write(storageRefreshToken, value);
  }

  Future<String?> getToken() async {
    return GetStorage().read<String>(storageName);
  }

  Future<String?> getRefreshToken() async {
    return GetStorage().read<String>(storageRefreshToken);
  }

  Future<bool> hasToken() async {
    final token = GetStorage().read<String>(storageName);
    return token != null && token.isNotEmpty;
  }

  Future<void> clear() async {
    await GetStorage().remove(storageName);
  }
}
