import 'package:dio/dio.dart';

Dio dioConfig() {
  return Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000/api', // 'https://tasks-manager.azurewebsites.net/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
}
