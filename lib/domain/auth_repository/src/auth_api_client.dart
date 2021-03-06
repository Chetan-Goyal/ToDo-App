import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/config/dio_config.dart';
import 'package:todo_app/domain/auth_repository/auth_repository.dart';

class AuthApiClient implements AuthRepository {
  static String authEndpoint = '/auth';

  @override
  Future<bool> register(String username, String email, String password) async {
    Response response;
    try {
      response = await dioConfig().post(
        "$authEndpoint/signup",
        data: {"username": username, "email": email, "password": password},
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      debugPrintStack(stackTrace: e.stackTrace);

      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }
    print(response.statusCode);
    print(response.data);

    return response.statusCode == 200;
  }

  @override
  Future<bool> login(String username, String password) async {
    Response response;
    try {
      response = await dioConfig().post(
        "$authEndpoint/signin",
        data: {"username": username, "password": password},
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      debugPrintStack(stackTrace: e.stackTrace);

      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }

    if (response.statusCode == 200) {
      await const FlutterSecureStorage().write(
        key: "accessToken",
        value: response.data['accessToken'],
      );
      return true;
    }

    return false;
  }

  @override
  Future<bool> validateToken(String token) async {
    Response response;
    try {
      response = await dioConfig().post(
        "$authEndpoint/validate",
        data: {"token": token},
      );
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      debugPrintStack(stackTrace: e.stackTrace);

      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      return false;
    }
    if (response.statusCode == 200) return true;
    return false;
  }
}
