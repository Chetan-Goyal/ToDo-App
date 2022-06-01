import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/view_models/tasks_provider.dart';

final tasksNotifierProvider = StateNotifierProvider<TasksNotifier, TasksState>(
  (ref) => TasksNotifier(),
);
