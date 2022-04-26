import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todo_app/domain/task_repository/task_repository.dart';

part 'tasks_provider.freezed.dart';

class TasksNotifier extends StateNotifier<TasksState> {
  TasksNotifier() : super(const TasksState.initial()) {
    getTasks();
  }

  final TaskRepository _taskRepository = GetIt.I.get<TaskRepository>();

  Future<void> getTasks() async {
    print("Getting Tasks");
    try {
      if (state is TasksLoaded) {
        state = TasksLoading((state as TasksLoaded).value);
      } else {
        state = const TasksLoading();
      }
      final List<TaskModel> tasks = await _taskRepository.getTasks();
      state = TasksLoaded(tasks);
    } catch (e) {
      state = const TasksError('Error while loading Tasks');
    }
  }

  Future<void> complete(TaskModel task) async {
    try {
      if (state is! TasksLoaded) {
        Fluttertoast.showToast(msg: 'Please wait for pending task to complete');
        return;
      }
      final tasks = (state as TasksLoaded).value;
      state = TasksLoading(tasks);

      final result = await _taskRepository.completeTask(task.id);
      if (result) tasks.remove(task);
      state = TasksLoaded(tasks);
    } catch (e) {
      state = const TasksError('Error while loading Tasks');
    }
  }

  Future<void> delete(TaskModel task) async {
    try {
      if (state is! TasksLoaded) {
        Fluttertoast.showToast(msg: 'Please wait for pending task to complete');
        return;
      }
      final tasks = (state as TasksLoaded).value;
      state = TasksLoading(tasks);

      final result = await _taskRepository.deleteTask(task.id);
      if (result) tasks.remove(task);
      state = TasksLoaded(tasks);
    } catch (e) {
      state = const TasksError('Error while loading Tasks');
    }
  }
}

@freezed
abstract class TasksState with _$TasksState {
  const factory TasksState.initial() = TasksInitial;
  const factory TasksState.loading([@Default([]) List<TaskModel> value]) =
      TasksLoading;
  const factory TasksState.error(String message) = TasksError;
  const factory TasksState.loaded(List<TaskModel> value) = TasksLoaded;
}
