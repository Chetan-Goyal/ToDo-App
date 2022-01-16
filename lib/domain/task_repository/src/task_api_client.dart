import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/config/dio_config.dart';
import 'package:todo_app/domain/task_repository/src/models/task_model.dart';
import 'package:todo_app/domain/task_repository/src/task_repository.dart';

class TaskApiClient implements TaskRepository {
  static String tasksEndpoint = '/v1';

  @override
  Future<bool> completeTask(String id) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/$id",
        options: Options(method: 'GET'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
    return response.statusCode == 200;
  }

  @override
  Future<bool> deleteTask(String id) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/$id",
        options: Options(method: 'DELETE'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
    return response.statusCode == 200;
  }

  @override
  Future getTasks() async {
    Response response;

    String? token = await const FlutterSecureStorage().read(key: 'accessToken');
    if (token == null) return {'tasks': []};
    print(token);
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks",
        options: Options(
            headers: {'x-access-token': token, 'Accept': '*/*'}, method: 'GET'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return {'tasks': []};
    }
    print(taskModelsFromJson(response.data));
    return taskModelsFromJson(response.data);
  }

  @override
  Future<bool> updateTask(TaskModel task) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/${task.id}",
        data: task.toJson(),
        options: Options(method: 'DELETE'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
    return response.statusCode == 200;
  }
}
