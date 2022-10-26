// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) successGet,
    required TResult Function() successSave,
    required TResult Function() initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? successGet,
    TResult? Function()? successSave,
    TResult? Function()? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? successGet,
    TResult Function()? successSave,
    TResult Function()? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessGet value) successGet,
    required TResult Function(_SuccessSave value) successSave,
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessGet value)? successGet,
    TResult? Function(_SuccessSave value)? successSave,
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessGet value)? successGet,
    TResult Function(_SuccessSave value)? successSave,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SuccessGetCopyWith<$Res> {
  factory _$$_SuccessGetCopyWith(
          _$_SuccessGet value, $Res Function(_$_SuccessGet) then) =
      __$$_SuccessGetCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$_SuccessGetCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_SuccessGet>
    implements _$$_SuccessGetCopyWith<$Res> {
  __$$_SuccessGetCopyWithImpl(
      _$_SuccessGet _value, $Res Function(_$_SuccessGet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_SuccessGet(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$_SuccessGet implements _SuccessGet {
  const _$_SuccessGet({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'UserState.successGet(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessGet &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessGetCopyWith<_$_SuccessGet> get copyWith =>
      __$$_SuccessGetCopyWithImpl<_$_SuccessGet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) successGet,
    required TResult Function() successSave,
    required TResult Function() initial,
  }) {
    return successGet(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? successGet,
    TResult? Function()? successSave,
    TResult? Function()? initial,
  }) {
    return successGet?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? successGet,
    TResult Function()? successSave,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (successGet != null) {
      return successGet(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessGet value) successGet,
    required TResult Function(_SuccessSave value) successSave,
    required TResult Function(_Initial value) initial,
  }) {
    return successGet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessGet value)? successGet,
    TResult? Function(_SuccessSave value)? successSave,
    TResult? Function(_Initial value)? initial,
  }) {
    return successGet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessGet value)? successGet,
    TResult Function(_SuccessSave value)? successSave,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (successGet != null) {
      return successGet(this);
    }
    return orElse();
  }
}

abstract class _SuccessGet implements UserState {
  const factory _SuccessGet({required final UserModel user}) = _$_SuccessGet;

  UserModel get user;
  @JsonKey(ignore: true)
  _$$_SuccessGetCopyWith<_$_SuccessGet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessSaveCopyWith<$Res> {
  factory _$$_SuccessSaveCopyWith(
          _$_SuccessSave value, $Res Function(_$_SuccessSave) then) =
      __$$_SuccessSaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessSaveCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_SuccessSave>
    implements _$$_SuccessSaveCopyWith<$Res> {
  __$$_SuccessSaveCopyWithImpl(
      _$_SuccessSave _value, $Res Function(_$_SuccessSave) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccessSave implements _SuccessSave {
  const _$_SuccessSave();

  @override
  String toString() {
    return 'UserState.successSave()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SuccessSave);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) successGet,
    required TResult Function() successSave,
    required TResult Function() initial,
  }) {
    return successSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? successGet,
    TResult? Function()? successSave,
    TResult? Function()? initial,
  }) {
    return successSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? successGet,
    TResult Function()? successSave,
    TResult Function()? initial,
    required TResult orElse(),
  }) {
    if (successSave != null) {
      return successSave();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessGet value) successGet,
    required TResult Function(_SuccessSave value) successSave,
    required TResult Function(_Initial value) initial,
  }) {
    return successSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessGet value)? successGet,
    TResult? Function(_SuccessSave value)? successSave,
    TResult? Function(_Initial value)? initial,
  }) {
    return successSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessGet value)? successGet,
    TResult Function(_SuccessSave value)? successSave,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (successSave != null) {
      return successSave(this);
    }
    return orElse();
  }
}

abstract class _SuccessSave implements UserState {
  const factory _SuccessSave() = _$_SuccessSave;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'UserState.initial()';
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
    required TResult Function(UserModel user) successGet,
    required TResult Function() successSave,
    required TResult Function() initial,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserModel user)? successGet,
    TResult? Function()? successSave,
    TResult? Function()? initial,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? successGet,
    TResult Function()? successSave,
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
    required TResult Function(_SuccessGet value) successGet,
    required TResult Function(_SuccessSave value) successSave,
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessGet value)? successGet,
    TResult? Function(_SuccessSave value)? successSave,
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessGet value)? successGet,
    TResult Function(_SuccessSave value)? successSave,
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getModel,
    required TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)
        saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getModel,
    TResult? Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getModel,
    TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getModel value) getModel,
    required TResult Function(_saveData value) saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getModel value)? getModel,
    TResult? Function(_saveData value)? saveData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getModel value)? getModel,
    TResult Function(_saveData value)? saveData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_getModelCopyWith<$Res> {
  factory _$$_getModelCopyWith(
          _$_getModel value, $Res Function(_$_getModel) then) =
      __$$_getModelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_getModelCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_getModel>
    implements _$$_getModelCopyWith<$Res> {
  __$$_getModelCopyWithImpl(
      _$_getModel _value, $Res Function(_$_getModel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_getModel implements _getModel {
  const _$_getModel();

  @override
  String toString() {
    return 'UserEvent.getModel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_getModel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getModel,
    required TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)
        saveData,
  }) {
    return getModel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getModel,
    TResult? Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
  }) {
    return getModel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getModel,
    TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
    required TResult orElse(),
  }) {
    if (getModel != null) {
      return getModel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getModel value) getModel,
    required TResult Function(_saveData value) saveData,
  }) {
    return getModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getModel value)? getModel,
    TResult? Function(_saveData value)? saveData,
  }) {
    return getModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getModel value)? getModel,
    TResult Function(_saveData value)? saveData,
    required TResult orElse(),
  }) {
    if (getModel != null) {
      return getModel(this);
    }
    return orElse();
  }
}

abstract class _getModel implements UserEvent {
  const factory _getModel() = _$_getModel;
}

/// @nodoc
abstract class _$$_saveDataCopyWith<$Res> {
  factory _$$_saveDataCopyWith(
          _$_saveData value, $Res Function(_$_saveData) then) =
      __$$_saveDataCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? name,
      String? surname,
      String? avatar,
      String? patronymic,
      String? login});
}

/// @nodoc
class __$$_saveDataCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$_saveData>
    implements _$$_saveDataCopyWith<$Res> {
  __$$_saveDataCopyWithImpl(
      _$_saveData _value, $Res Function(_$_saveData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? avatar = freezed,
    Object? patronymic = freezed,
    Object? login = freezed,
  }) {
    return _then(_$_saveData(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      patronymic: freezed == patronymic
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String?,
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_saveData implements _saveData {
  const _$_saveData(
      {this.name, this.surname, this.avatar, this.patronymic, this.login});

  @override
  final String? name;
  @override
  final String? surname;
  @override
  final String? avatar;
  @override
  final String? patronymic;
  @override
  final String? login;

  @override
  String toString() {
    return 'UserEvent.saveData(name: $name, surname: $surname, avatar: $avatar, patronymic: $patronymic, login: $login)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_saveData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.patronymic, patronymic) ||
                other.patronymic == patronymic) &&
            (identical(other.login, login) || other.login == login));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, surname, avatar, patronymic, login);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_saveDataCopyWith<_$_saveData> get copyWith =>
      __$$_saveDataCopyWithImpl<_$_saveData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getModel,
    required TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)
        saveData,
  }) {
    return saveData(name, surname, avatar, patronymic, login);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getModel,
    TResult? Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
  }) {
    return saveData?.call(name, surname, avatar, patronymic, login);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getModel,
    TResult Function(String? name, String? surname, String? avatar,
            String? patronymic, String? login)?
        saveData,
    required TResult orElse(),
  }) {
    if (saveData != null) {
      return saveData(name, surname, avatar, patronymic, login);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getModel value) getModel,
    required TResult Function(_saveData value) saveData,
  }) {
    return saveData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getModel value)? getModel,
    TResult? Function(_saveData value)? saveData,
  }) {
    return saveData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getModel value)? getModel,
    TResult Function(_saveData value)? saveData,
    required TResult orElse(),
  }) {
    if (saveData != null) {
      return saveData(this);
    }
    return orElse();
  }
}

abstract class _saveData implements UserEvent {
  const factory _saveData(
      {final String? name,
      final String? surname,
      final String? avatar,
      final String? patronymic,
      final String? login}) = _$_saveData;

  String? get name;
  String? get surname;
  String? get avatar;
  String? get patronymic;
  String? get login;
  @JsonKey(ignore: true)
  _$$_saveDataCopyWith<_$_saveData> get copyWith =>
      throw _privateConstructorUsedError;
}
