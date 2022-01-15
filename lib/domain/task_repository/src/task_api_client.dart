import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/config/dio_config.dart';
import 'package:todo_app/domain/task_repository/src/models/task_model.dart';
import 'package:todo_app/domain/task_repository/src/task_repository.dart';

class TaskApiClient implements TaskRepository {
  static String tasksEndpoint = '/api/v1';

  @override
  Future<bool> completeTask(String id) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/$id",
        options: Options(method: 'GET'),
      );
    } on DioError catch (e) {
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
      return false;
    }
    return response.statusCode == 200;
  }

  @override
  Future getTasks() async {
    // return false;
  }

  @override
  Future updateTask(TaskModel task) async {
    Response response;
    try {
      response = await dioConfig().request(
        "$tasksEndpoint/tasks/${task.id}",
        data: task.toJson(),
        options: Options(method: 'DELETE'),
      );
    } on DioError catch (e) {
      return false;
    }
    return response.statusCode == 200;
  }
}
