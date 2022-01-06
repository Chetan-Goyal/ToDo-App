import 'package:dio/dio.dart';

Dio dioConfig() {
  return Dio(
    BaseOptions(
      baseUrl: 'http://localhost:5555/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
}
