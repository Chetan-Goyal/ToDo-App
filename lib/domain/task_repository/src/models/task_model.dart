import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

List<TaskModel> taskModelsFromJson(Map<String, dynamic> tasks) =>
    // ! Here, We can see an anomality when 'as List' is not specified
    (tasks['tasks'] as List).map((task) {
      return TaskModel.fromJson(task);
    }).toList();

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @JsonKey(name: '_id') // ignore: invalid_annotation_target
        required String? id,
    required String name,
    required bool completed,
    required String userId,
    @Default('Default')
        String category,
    required DateTime? deadline,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
