import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_app/config/dio_config.dart';
import 'package:todo_app/domain/task_repository/task_repository.dart';

class TaskApiClient implements TaskRepository {
  static String tasksEndpoint = '/v1';

  @override
  Future<bool> completeTask(String id) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/complete/$id",
        // options: Options(method: 'PATCH'),
      );
    } on DioError catch (e) {
      print(e);
      return false;
    } catch (e) {
      print(e);
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
  Future<List<TaskModel>> getTasks() async {
    Response response;

    String? token = await const FlutterSecureStorage().read(key: 'accessToken');

    if (token == null) return [];
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks",
        options: Options(
            headers: {'x-access-token': token, 'Accept': '*/*'}, method: 'GET'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return [];
    }
    // print(taskModelsFromJson(response.data));
    return taskModelsFromJson(response.data);
  }

  @override
  Future<bool> updateTask(TaskModel task) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/${task.id}",
        data: task.toJson(),
        // Todo: Check Delete Method for updateTask
        options: Options(method: 'DELETE'),
      );
    } on DioError catch (e) {
      debugPrintStack(stackTrace: e.stackTrace);
      return false;
    }
    return response.statusCode == 200;
  }

  @override
  Future<bool> addTask({
    required String name,
    required String? category,
    required bool isImportant,
    required bool isReminderSet,
    Color? color,
    DateTime? deadline,
  }) async {
    Response response;
    try {
      String? token =
          await const FlutterSecureStorage().read(key: 'accessToken');

      if (token == null) return false;

      Map<String, dynamic> body = {};

      body['name'] = name;
      body['category'] = category;
      body['isImportant'] = isImportant;
      body['isReminderSet'] = isReminderSet;
      body['color'] = color == null
          ? null
          : '#${color.value.toRadixString(16).padLeft(8, '0')}';
      body['deadline'] = deadline?.millisecondsSinceEpoch;

      print(token);
      print("$tasksEndpoint/tasks");
      print(body);

      response = await dioConfig().request(
        "$tasksEndpoint/tasks",
        data: body,
        options: Options(
          headers: {'x-access-token': token, 'Accept': '*/*'},
          method: 'POST',
        ),
      );
    } on DioError catch (e) {
      print(e);
      return false;
    }
    return response.statusCode == 201;
  }
}
