import 'package:dio/dio.dart';

Dio dioConfig() {
  return Dio(
    BaseOptions(
      baseUrl: 'https://tasks-manager.azurewebsites.net/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
}
