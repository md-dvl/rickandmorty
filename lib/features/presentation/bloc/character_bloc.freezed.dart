// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CharacterModel> chars) success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CharacterModel> chars)? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CharacterModel> chars)? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterStateCopyWith<$Res> {
  factory $CharacterStateCopyWith(
          CharacterState value, $Res Function(CharacterState) then) =
      _$CharacterStateCopyWithImpl<$Res, CharacterState>;
}

/// @nodoc
class _$CharacterStateCopyWithImpl<$Res, $Val extends CharacterState>
    implements $CharacterStateCopyWith<$Res> {
  _$CharacterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CharacterModel> chars});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chars = null,
  }) {
    return _then(_$_Success(
      chars: null == chars
          ? _value._chars
          : chars // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required final List<CharacterModel> chars})
      : _chars = chars;

  final List<CharacterModel> _chars;
  @override
  List<CharacterModel> get chars {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chars);
  }

  @override
  String toString() {
    return 'CharacterState.success(chars: $chars)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other._chars, _chars));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CharacterModel> chars) success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
  }) {
    return success(chars);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CharacterModel> chars)? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
  }) {
    return success?.call(chars);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CharacterModel> chars)? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(chars);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CharacterState {
  const factory _Success({required final List<CharacterModel> chars}) =
      _$_Success;

  List<CharacterModel> get chars;
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CharacterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CharacterModel> chars) success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CharacterModel> chars)? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CharacterModel> chars)? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CharacterState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error();

  @override
  String toString() {
    return 'CharacterState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CharacterModel> chars) success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CharacterModel> chars)? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CharacterModel> chars)? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CharacterState {
  const factory _Error() = _$_Error;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CharacterStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'CharacterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CharacterModel> chars) success,
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CharacterModel> chars)? success,
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CharacterModel> chars)? success,
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? initial,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CharacterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
mixin _$CharacterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterEventCopyWith<$Res> {
  factory $CharacterEventCopyWith(
          CharacterEvent value, $Res Function(CharacterEvent) then) =
      _$CharacterEventCopyWithImpl<$Res, CharacterEvent>;
}

/// @nodoc
class _$CharacterEventCopyWithImpl<$Res, $Val extends CharacterEvent>
    implements $CharacterEventCopyWith<$Res> {
  _$CharacterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_getAllCharactersCopyWith<$Res> {
  factory _$$_getAllCharactersCopyWith(
          _$_getAllCharacters value, $Res Function(_$_getAllCharacters) then) =
      __$$_getAllCharactersCopyWithImpl<$Res>;
  @useResult
  $Res call({String? text, int? currentPage});
}

/// @nodoc
class __$$_getAllCharactersCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res, _$_getAllCharacters>
    implements _$$_getAllCharactersCopyWith<$Res> {
  __$$_getAllCharactersCopyWithImpl(
      _$_getAllCharacters _value, $Res Function(_$_getAllCharacters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$_getAllCharacters(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_getAllCharacters implements _getAllCharacters {
  const _$_getAllCharacters({this.text, this.currentPage});

  @override
  final String? text;
  @override
  final int? currentPage;

  @override
  String toString() {
    return 'CharacterEvent.getAllCharacters(text: $text, currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getAllCharacters &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getAllCharactersCopyWith<_$_getAllCharacters> get copyWith =>
      __$$_getAllCharactersCopyWithImpl<_$_getAllCharacters>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) {
    return getAllCharacters(text, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) {
    return getAllCharacters?.call(text, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) {
    if (getAllCharacters != null) {
      return getAllCharacters(text, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) {
    return getAllCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) {
    return getAllCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) {
    if (getAllCharacters != null) {
      return getAllCharacters(this);
    }
    return orElse();
  }
}

abstract class _getAllCharacters implements CharacterEvent {
  const factory _getAllCharacters(
      {final String? text, final int? currentPage}) = _$_getAllCharacters;

  String? get text;
  int? get currentPage;
  @JsonKey(ignore: true)
  _$$_getAllCharactersCopyWith<_$_getAllCharacters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_getSearchedCharactersCopyWith<$Res> {
  factory _$$_getSearchedCharactersCopyWith(_$_getSearchedCharacters value,
          $Res Function(_$_getSearchedCharacters) then) =
      __$$_getSearchedCharactersCopyWithImpl<$Res>;
  @useResult
  $Res call({String? text});
}

/// @nodoc
class __$$_getSearchedCharactersCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res, _$_getSearchedCharacters>
    implements _$$_getSearchedCharactersCopyWith<$Res> {
  __$$_getSearchedCharactersCopyWithImpl(_$_getSearchedCharacters _value,
      $Res Function(_$_getSearchedCharacters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_$_getSearchedCharacters(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_getSearchedCharacters implements _getSearchedCharacters {
  const _$_getSearchedCharacters({this.text});

  @override
  final String? text;

  @override
  String toString() {
    return 'CharacterEvent.getSearchedCharacters(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getSearchedCharacters &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getSearchedCharactersCopyWith<_$_getSearchedCharacters> get copyWith =>
      __$$_getSearchedCharactersCopyWithImpl<_$_getSearchedCharacters>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) {
    return getSearchedCharacters(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) {
    return getSearchedCharacters?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) {
    if (getSearchedCharacters != null) {
      return getSearchedCharacters(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) {
    return getSearchedCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) {
    return getSearchedCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) {
    if (getSearchedCharacters != null) {
      return getSearchedCharacters(this);
    }
    return orElse();
  }
}

abstract class _getSearchedCharacters implements CharacterEvent {
  const factory _getSearchedCharacters({final String? text}) =
      _$_getSearchedCharacters;

  String? get text;
  @JsonKey(ignore: true)
  _$$_getSearchedCharactersCopyWith<_$_getSearchedCharacters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_getFilteredCharactersCopyWith<$Res> {
  factory _$$_getFilteredCharactersCopyWith(_$_getFilteredCharacters value,
          $Res Function(_$_getFilteredCharacters) then) =
      __$$_getFilteredCharactersCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$_getFilteredCharactersCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res, _$_getFilteredCharacters>
    implements _$$_getFilteredCharactersCopyWith<$Res> {
  __$$_getFilteredCharactersCopyWithImpl(_$_getFilteredCharacters _value,
      $Res Function(_$_getFilteredCharacters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_getFilteredCharacters(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_getFilteredCharacters implements _getFilteredCharacters {
  const _$_getFilteredCharacters({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'CharacterEvent.getFilteredCharacters(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_getFilteredCharacters &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_getFilteredCharactersCopyWith<_$_getFilteredCharacters> get copyWith =>
      __$$_getFilteredCharactersCopyWithImpl<_$_getFilteredCharacters>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) {
    return getFilteredCharacters(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) {
    return getFilteredCharacters?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) {
    if (getFilteredCharacters != null) {
      return getFilteredCharacters(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) {
    return getFilteredCharacters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) {
    return getFilteredCharacters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) {
    if (getFilteredCharacters != null) {
      return getFilteredCharacters(this);
    }
    return orElse();
  }
}

abstract class _getFilteredCharacters implements CharacterEvent {
  const factory _getFilteredCharacters({final String? status}) =
      _$_getFilteredCharacters;

  String? get status;
  @JsonKey(ignore: true)
  _$$_getFilteredCharactersCopyWith<_$_getFilteredCharacters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_setFiltersCopyWith<$Res> {
  factory _$$_setFiltersCopyWith(
          _$_setFilters value, $Res Function(_$_setFilters) then) =
      __$$_setFiltersCopyWithImpl<$Res>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$_setFiltersCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res, _$_setFilters>
    implements _$$_setFiltersCopyWith<$Res> {
  __$$_setFiltersCopyWithImpl(
      _$_setFilters _value, $Res Function(_$_setFilters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_setFilters(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_setFilters implements _setFilters {
  const _$_setFilters({this.status});

  @override
  final String? status;

  @override
  String toString() {
    return 'CharacterEvent.setFilters(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_setFilters &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_setFiltersCopyWith<_$_setFilters> get copyWith =>
      __$$_setFiltersCopyWithImpl<_$_setFilters>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) {
    return setFilters(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) {
    return setFilters?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) {
    if (setFilters != null) {
      return setFilters(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) {
    return setFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) {
    return setFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) {
    if (setFilters != null) {
      return setFilters(this);
    }
    return orElse();
  }
}

abstract class _setFilters implements CharacterEvent {
  const factory _setFilters({final String? status}) = _$_setFilters;

  String? get status;
  @JsonKey(ignore: true)
  _$$_setFiltersCopyWith<_$_setFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_getFiltersCopyWith<$Res> {
  factory _$$_getFiltersCopyWith(
          _$_getFilters value, $Res Function(_$_getFilters) then) =
      __$$_getFiltersCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_getFiltersCopyWithImpl<$Res>
    extends _$CharacterEventCopyWithImpl<$Res, _$_getFilters>
    implements _$$_getFiltersCopyWith<$Res> {
  __$$_getFiltersCopyWithImpl(
      _$_getFilters _value, $Res Function(_$_getFilters) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_getFilters implements _getFilters {
  const _$_getFilters();

  @override
  String toString() {
    return 'CharacterEvent.getFilters()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_getFilters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? text, int? currentPage) getAllCharacters,
    required TResult Function(String? text) getSearchedCharacters,
    required TResult Function(String? status) getFilteredCharacters,
    required TResult Function(String? status) setFilters,
    required TResult Function() getFilters,
  }) {
    return getFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? text, int? currentPage)? getAllCharacters,
    TResult? Function(String? text)? getSearchedCharacters,
    TResult? Function(String? status)? getFilteredCharacters,
    TResult? Function(String? status)? setFilters,
    TResult? Function()? getFilters,
  }) {
    return getFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? text, int? currentPage)? getAllCharacters,
    TResult Function(String? text)? getSearchedCharacters,
    TResult Function(String? status)? getFilteredCharacters,
    TResult Function(String? status)? setFilters,
    TResult Function()? getFilters,
    required TResult orElse(),
  }) {
    if (getFilters != null) {
      return getFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllCharacters value) getAllCharacters,
    required TResult Function(_getSearchedCharacters value)
        getSearchedCharacters,
    required TResult Function(_getFilteredCharacters value)
        getFilteredCharacters,
    required TResult Function(_setFilters value) setFilters,
    required TResult Function(_getFilters value) getFilters,
  }) {
    return getFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllCharacters value)? getAllCharacters,
    TResult? Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult? Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult? Function(_setFilters value)? setFilters,
    TResult? Function(_getFilters value)? getFilters,
  }) {
    return getFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getAllCharacters value)? getAllCharacters,
    TResult Function(_getSearchedCharacters value)? getSearchedCharacters,
    TResult Function(_getFilteredCharacters value)? getFilteredCharacters,
    TResult Function(_setFilters value)? setFilters,
    TResult Function(_getFilters value)? getFilters,
    required TResult orElse(),
  }) {
    if (getFilters != null) {
      return getFilters(this);
    }
    return orElse();
  }
}

abstract class _getFilters implements CharacterEvent {
  const factory _getFilters() = _$_getFilters;
}
