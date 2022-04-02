import 'package:flutter/material.dart';
import 'package:todo_app/domain/task_repository/src/models/task_model.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future<List<TaskModel>> getTasks();
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(String id);
  Future<bool> addTask({
    required String name,
    required String? category,
    required bool isImportant,
    required bool isReminderSet,
    Color? color,
  });
  Future<bool> completeTask(String id);
}
