import 'dart:async';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class UserStorage {
  final storageName = 'me';
  final storageNameRole = 'role';

  Future<UserStorage> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> saveRole(String value) async {
    await GetStorage().write(storageNameRole, value);
  }

  Future<String?> getRole() async {
    return GetStorage().read<String>(storageNameRole);
  }

  Future<void> saveUser(Map<String, dynamic> value) async {
    log('message :: data user ::: $value');
    await GetStorage().remove(storageName);
    await GetStorage().write(storageName, value);
  }

  Future<Map<String, dynamic>?> getUser() async {
    return GetStorage().read<Map<String, dynamic>>(storageName);
  }

  Future<bool> hasToken() async {
    final role = GetStorage().read<String>(storageNameRole);
    return role != null && role.isNotEmpty;
  }

  Future<void> clear() async {
    await GetStorage().remove(storageName);
    await GetStorage().remove(storageNameRole);
  }
}
