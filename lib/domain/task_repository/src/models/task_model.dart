import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

TaskModel taskModelFromMap(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToMap(TaskModel data) => json.encode(data.toJson());

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String name,
    required bool completed,
    required String userId,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
