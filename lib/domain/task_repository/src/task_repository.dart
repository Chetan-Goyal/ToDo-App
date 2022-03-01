import 'package:todo_app/domain/task_repository/src/models/task_model.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future<List<TaskModel>> getTasks();
  Future<bool> updateTask(TaskModel task);
  Future<bool> deleteTask(String id);
  Future<bool> addTask(String name, String category);
  Future<bool> completeTask(String id);
}
