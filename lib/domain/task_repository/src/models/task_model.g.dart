// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskModel _$$_TaskModelFromJson(Map<String, dynamic> json) => _$_TaskModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as String,
      category: (json['category'] ?? 'Default') as String,
    );

Map<String, dynamic> _$$_TaskModelToJson(_$_TaskModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
      'userId': instance.userId,
      'category': instance.category,
    };
