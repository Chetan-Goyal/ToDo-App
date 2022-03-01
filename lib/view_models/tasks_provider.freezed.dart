// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TasksStateTearOff {
  const _$TasksStateTearOff();

  TasksInitial initial() {
    return const TasksInitial();
  }

  TasksLoading loading([List<TaskModel> value = const []]) {
    return TasksLoading(
      value,
    );
  }

  TasksError error(String message) {
    return TasksError(
      message,
    );
  }

  TasksLoaded loaded(List<TaskModel> value) {
    return TasksLoaded(
      value,
    );
  }
}

/// @nodoc
const $TasksState = _$TasksStateTearOff();

/// @nodoc
mixin _$TasksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TaskModel> value) loading,
    required TResult Function(String message) error,
    required TResult Function(List<TaskModel> value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksError value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res> implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  final TasksState _value;
  // ignore: unused_field
  final $Res Function(TasksState) _then;
}

/// @nodoc
abstract class $TasksInitialCopyWith<$Res> {
  factory $TasksInitialCopyWith(
          TasksInitial value, $Res Function(TasksInitial) then) =
      _$TasksInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$TasksInitialCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements $TasksInitialCopyWith<$Res> {
  _$TasksInitialCopyWithImpl(
      TasksInitial _value, $Res Function(TasksInitial) _then)
      : super(_value, (v) => _then(v as TasksInitial));

  @override
  TasksInitial get _value => super._value as TasksInitial;
}

/// @nodoc

class _$TasksInitial implements TasksInitial {
  const _$TasksInitial();

  @override
  String toString() {
    return 'TasksState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TasksInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TaskModel> value) loading,
    required TResult Function(String message) error,
    required TResult Function(List<TaskModel> value) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksError value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TasksInitial implements TasksState {
  const factory TasksInitial() = _$TasksInitial;
}

/// @nodoc
abstract class $TasksLoadingCopyWith<$Res> {
  factory $TasksLoadingCopyWith(
          TasksLoading value, $Res Function(TasksLoading) then) =
      _$TasksLoadingCopyWithImpl<$Res>;
  $Res call({List<TaskModel> value});
}

/// @nodoc
class _$TasksLoadingCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements $TasksLoadingCopyWith<$Res> {
  _$TasksLoadingCopyWithImpl(
      TasksLoading _value, $Res Function(TasksLoading) _then)
      : super(_value, (v) => _then(v as TasksLoading));

  @override
  TasksLoading get _value => super._value as TasksLoading;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(TasksLoading(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$TasksLoading implements TasksLoading {
  const _$TasksLoading([this.value = const []]);

  @JsonKey()
  @override
  final List<TaskModel> value;

  @override
  String toString() {
    return 'TasksState.loading(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TasksLoading &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $TasksLoadingCopyWith<TasksLoading> get copyWith =>
      _$TasksLoadingCopyWithImpl<TasksLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TaskModel> value) loading,
    required TResult Function(String message) error,
    required TResult Function(List<TaskModel> value) loaded,
  }) {
    return loading(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
  }) {
    return loading?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksError value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TasksLoading implements TasksState {
  const factory TasksLoading([List<TaskModel> value]) = _$TasksLoading;

  List<TaskModel> get value;
  @JsonKey(ignore: true)
  $TasksLoadingCopyWith<TasksLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksErrorCopyWith<$Res> {
  factory $TasksErrorCopyWith(
          TasksError value, $Res Function(TasksError) then) =
      _$TasksErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$TasksErrorCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements $TasksErrorCopyWith<$Res> {
  _$TasksErrorCopyWithImpl(TasksError _value, $Res Function(TasksError) _then)
      : super(_value, (v) => _then(v as TasksError));

  @override
  TasksError get _value => super._value as TasksError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(TasksError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TasksError implements TasksError {
  const _$TasksError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TasksState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TasksError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $TasksErrorCopyWith<TasksError> get copyWith =>
      _$TasksErrorCopyWithImpl<TasksError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TaskModel> value) loading,
    required TResult Function(String message) error,
    required TResult Function(List<TaskModel> value) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksError value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TasksError implements TasksState {
  const factory TasksError(String message) = _$TasksError;

  String get message;
  @JsonKey(ignore: true)
  $TasksErrorCopyWith<TasksError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksLoadedCopyWith<$Res> {
  factory $TasksLoadedCopyWith(
          TasksLoaded value, $Res Function(TasksLoaded) then) =
      _$TasksLoadedCopyWithImpl<$Res>;
  $Res call({List<TaskModel> value});
}

/// @nodoc
class _$TasksLoadedCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements $TasksLoadedCopyWith<$Res> {
  _$TasksLoadedCopyWithImpl(
      TasksLoaded _value, $Res Function(TasksLoaded) _then)
      : super(_value, (v) => _then(v as TasksLoaded));

  @override
  TasksLoaded get _value => super._value as TasksLoaded;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(TasksLoaded(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$TasksLoaded implements TasksLoaded {
  const _$TasksLoaded(this.value);

  @override
  final List<TaskModel> value;

  @override
  String toString() {
    return 'TasksState.loaded(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TasksLoaded &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $TasksLoadedCopyWith<TasksLoaded> get copyWith =>
      _$TasksLoadedCopyWithImpl<TasksLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TaskModel> value) loading,
    required TResult Function(String message) error,
    required TResult Function(List<TaskModel> value) loaded,
  }) {
    return loaded(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
  }) {
    return loaded?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TaskModel> value)? loading,
    TResult Function(String message)? error,
    TResult Function(List<TaskModel> value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TasksInitial value) initial,
    required TResult Function(TasksLoading value) loading,
    required TResult Function(TasksError value) error,
    required TResult Function(TasksLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TasksInitial value)? initial,
    TResult Function(TasksLoading value)? loading,
    TResult Function(TasksError value)? error,
    TResult Function(TasksLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TasksLoaded implements TasksState {
  const factory TasksLoaded(List<TaskModel> value) = _$TasksLoaded;

  List<TaskModel> get value;
  @JsonKey(ignore: true)
  $TasksLoadedCopyWith<TasksLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
