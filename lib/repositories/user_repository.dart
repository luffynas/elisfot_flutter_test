import 'dart:async';

import 'package:elisoft_flutter_test/core/user_storage.dart';
import 'package:elisoft_flutter_test/models/user.dart';

class UserRepository {
  UserRepository();

  UserStorage userStorage = UserStorage();

  Future<void> saveRole(String role) async {
    await userStorage.saveRole(role);
  }

  Future<String?> getRole() async {
    return userStorage.getRole();
  }

  Future<void> saveUser(Map<String, dynamic> user) async {
    await userStorage.saveUser(user);
  }

  Future<User?> getUser() async {
    final user = await userStorage.getUser();
    return user != null ? User.fromJson(user) : null;
  }
}
