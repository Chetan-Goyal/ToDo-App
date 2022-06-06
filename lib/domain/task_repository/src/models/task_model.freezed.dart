// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;
  bool get isImportant => throw _privateConstructorUsedError;
  bool get isReminderSet => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      bool completed,
      String userId,
      String category,
      DateTime? deadline,
      bool isImportant,
      bool isReminderSet,
      String? color});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  final TaskModel _value;
  // ignore: unused_field
  final $Res Function(TaskModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
    Object? userId = freezed,
    Object? category = freezed,
    Object? deadline = freezed,
    Object? isImportant = freezed,
    Object? isReminderSet = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isImportant: isImportant == freezed
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
      isReminderSet: isReminderSet == freezed
          ? _value.isReminderSet
          : isReminderSet // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      bool completed,
      String userId,
      String category,
      DateTime? deadline,
      bool isImportant,
      bool isReminderSet,
      String? color});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res> extends _$TaskModelCopyWithImpl<$Res>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, (v) => _then(v as _$_TaskModel));

  @override
  _$_TaskModel get _value => super._value as _$_TaskModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
    Object? userId = freezed,
    Object? category = freezed,
    Object? deadline = freezed,
    Object? isImportant = freezed,
    Object? isReminderSet = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_TaskModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isImportant: isImportant == freezed
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool,
      isReminderSet: isReminderSet == freezed
          ? _value.isReminderSet
          : isReminderSet // ignore: cast_nullable_to_non_nullable
              as bool,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel implements _TaskModel {
  const _$_TaskModel(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.completed,
      required this.userId,
      this.category = 'Default',
      required this.deadline,
      required this.isImportant,
      required this.isReminderSet,
      required this.color});

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final bool completed;
  @override
  final String userId;
  @override
  @JsonKey()
  final String category;
  @override
  final DateTime? deadline;
  @override
  final bool isImportant;
  @override
  final bool isReminderSet;
  @override
  final String? color;

  @override
  String toString() {
    return 'TaskModel(id: $id, name: $name, completed: $completed, userId: $userId, category: $category, deadline: $deadline, isImportant: $isImportant, isReminderSet: $isReminderSet, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.completed, completed) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality()
                .equals(other.isImportant, isImportant) &&
            const DeepCollectionEquality()
                .equals(other.isReminderSet, isReminderSet) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(completed),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(isImportant),
      const DeepCollectionEquality().hash(isReminderSet),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(this);
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final bool completed,
      required final String userId,
      final String category,
      required final DateTime? deadline,
      required final bool isImportant,
      required final bool isReminderSet,
      required final String? color}) = _$_TaskModel;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get completed => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  DateTime? get deadline => throw _privateConstructorUsedError;
  @override
  bool get isImportant => throw _privateConstructorUsedError;
  @override
  bool get isReminderSet => throw _privateConstructorUsedError;
  @override
  String? get color => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
