import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

List<TaskModel> taskModelsFromJson(Map<String, dynamic> tasks) {
  // Serialising Data
  final mappedTasks = (tasks['tasks'] as List).map((task) {
    return TaskModel.fromJson(task);
  }).toList();

  // Sorting tasks to place important tasks first
  mappedTasks.sort(
    (first, second) {
      if (first.isImportant == second.isImportant) {
        return 0;
      } else if (first.isImportant) {
        return -1;
      } else {
        return 1;
      }
    },
  );
  return mappedTasks;
}

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: '_id') // ignore: invalid_annotation_target
        required String id,
    required String name,
    required bool completed,
    required String userId,
    @Default('Default')
        String category,
    required DateTime? deadline,
    required bool isImportant,
    required bool isReminderSet,
    required String? color,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
