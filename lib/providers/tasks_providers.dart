import 'package:riverpod/riverpod.dart';
import 'package:todo_app/view_models/tasks_provider.dart';

final tasksNotifierProvider = StateNotifierProvider<TasksNotifier, TasksState>(
  (ref) => TasksNotifier(),
);
