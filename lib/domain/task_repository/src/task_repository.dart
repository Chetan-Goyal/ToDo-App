import 'package:todo_app/domain/task_repository/src/models/task_model.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future getTasks();
  Future updateTask(TaskModel task);
  Future deleteTask(String id);
  Future completeTask(String id);
}
