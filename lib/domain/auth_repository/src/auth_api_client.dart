import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/config/dio_config.dart';
import 'package:todo_app/domain/auth_repository/auth_repository.dart';

class AuthApiClient implements AuthRepository {
  @override
  Future<bool> register(String username, String email, String password) async {
    Response response = await dioConfig().request(
      "/auth/signup",
      data: {"username": username, "email": email, "password": password},
      options: Options(method: 'POST'),
    );

    return response.statusCode == 200;
  }

  @override
  Future<bool> login(String username, String password) async {
    Response response = await dioConfig().request(
      "/auth/signin",
      data: {"username": username, "password": password},
      options: Options(method: 'POST'),
    );

    if (response.statusCode == 200) {
      await const FlutterSecureStorage().write(
        key: "accessToken",
        value: response.data['accessToken'],
      );
      return true;
    }

    return false;
  }
}
