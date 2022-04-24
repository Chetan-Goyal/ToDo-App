import 'package:dio/dio.dart';

Dio dioConfig() {
  return Dio(
    BaseOptions(
      baseUrl:
          'https://tasks-manager.azurewebsites.net/api', //'http://10.0.2.2:3000/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
}
