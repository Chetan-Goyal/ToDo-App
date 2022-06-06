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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$TasksInitialCopyWith<$Res> {
  factory _$$TasksInitialCopyWith(
          _$TasksInitial value, $Res Function(_$TasksInitial) then) =
      __$$TasksInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksInitialCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements _$$TasksInitialCopyWith<$Res> {
  __$$TasksInitialCopyWithImpl(
      _$TasksInitial _value, $Res Function(_$TasksInitial) _then)
      : super(_value, (v) => _then(v as _$TasksInitial));

  @override
  _$TasksInitial get _value => super._value as _$TasksInitial;
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
        (other.runtimeType == runtimeType && other is _$TasksInitial);
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
abstract class _$$TasksLoadingCopyWith<$Res> {
  factory _$$TasksLoadingCopyWith(
          _$TasksLoading value, $Res Function(_$TasksLoading) then) =
      __$$TasksLoadingCopyWithImpl<$Res>;
  $Res call({List<TaskModel> value});
}

/// @nodoc
class __$$TasksLoadingCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements _$$TasksLoadingCopyWith<$Res> {
  __$$TasksLoadingCopyWithImpl(
      _$TasksLoading _value, $Res Function(_$TasksLoading) _then)
      : super(_value, (v) => _then(v as _$TasksLoading));

  @override
  _$TasksLoading get _value => super._value as _$TasksLoading;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$TasksLoading(
      value == freezed
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$TasksLoading implements TasksLoading {
  const _$TasksLoading([final List<TaskModel> value = const []])
      : _value = value;

  final List<TaskModel> _value;
  @override
  @JsonKey()
  List<TaskModel> get value {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'TasksState.loading(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksLoading &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  _$$TasksLoadingCopyWith<_$TasksLoading> get copyWith =>
      __$$TasksLoadingCopyWithImpl<_$TasksLoading>(this, _$identity);

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
  const factory TasksLoading([final List<TaskModel> value]) = _$TasksLoading;

  List<TaskModel> get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TasksLoadingCopyWith<_$TasksLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksErrorCopyWith<$Res> {
  factory _$$TasksErrorCopyWith(
          _$TasksError value, $Res Function(_$TasksError) then) =
      __$$TasksErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$TasksErrorCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements _$$TasksErrorCopyWith<$Res> {
  __$$TasksErrorCopyWithImpl(
      _$TasksError _value, $Res Function(_$TasksError) _then)
      : super(_value, (v) => _then(v as _$TasksError));

  @override
  _$TasksError get _value => super._value as _$TasksError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TasksError(
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
            other is _$TasksError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$TasksErrorCopyWith<_$TasksError> get copyWith =>
      __$$TasksErrorCopyWithImpl<_$TasksError>(this, _$identity);

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
  const factory TasksError(final String message) = _$TasksError;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TasksErrorCopyWith<_$TasksError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksLoadedCopyWith<$Res> {
  factory _$$TasksLoadedCopyWith(
          _$TasksLoaded value, $Res Function(_$TasksLoaded) then) =
      __$$TasksLoadedCopyWithImpl<$Res>;
  $Res call({List<TaskModel> value});
}

/// @nodoc
class __$$TasksLoadedCopyWithImpl<$Res> extends _$TasksStateCopyWithImpl<$Res>
    implements _$$TasksLoadedCopyWith<$Res> {
  __$$TasksLoadedCopyWithImpl(
      _$TasksLoaded _value, $Res Function(_$TasksLoaded) _then)
      : super(_value, (v) => _then(v as _$TasksLoaded));

  @override
  _$TasksLoaded get _value => super._value as _$TasksLoaded;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$TasksLoaded(
      value == freezed
          ? _value._value
          : value // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc

class _$TasksLoaded implements TasksLoaded {
  const _$TasksLoaded(final List<TaskModel> value) : _value = value;

  final List<TaskModel> _value;
  @override
  List<TaskModel> get value {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_value);
  }

  @override
  String toString() {
    return 'TasksState.loaded(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksLoaded &&
            const DeepCollectionEquality().equals(other._value, _value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_value));

  @JsonKey(ignore: true)
  @override
  _$$TasksLoadedCopyWith<_$TasksLoaded> get copyWith =>
      __$$TasksLoadedCopyWithImpl<_$TasksLoaded>(this, _$identity);

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
  const factory TasksLoaded(final List<TaskModel> value) = _$TasksLoaded;

  List<TaskModel> get value => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TasksLoadedCopyWith<_$TasksLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
