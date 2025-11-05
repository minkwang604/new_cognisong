// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStat _$UserStatFromJson(Map<String, dynamic> json) {
  return _UserStat.fromJson(json);
}

/// @nodoc
mixin _$UserStat {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int get userId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get song => throw _privateConstructorUsedError;
  @JsonKey(name: "pre_level")
  bool get preLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_practiced')
  bool get isPracticed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStatCopyWith<UserStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatCopyWith<$Res> {
  factory $UserStatCopyWith(UserStat value, $Res Function(UserStat) then) =
      _$UserStatCopyWithImpl<$Res, UserStat>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "user_id") int userId,
      int level,
      int song,
      @JsonKey(name: "pre_level") bool preLevel,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_practiced') bool isPracticed});
}

/// @nodoc
class _$UserStatCopyWithImpl<$Res, $Val extends UserStat>
    implements $UserStatCopyWith<$Res> {
  _$UserStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? level = null,
    Object? song = null,
    Object? preLevel = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPracticed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      preLevel: null == preLevel
          ? _value.preLevel
          : preLevel // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPracticed: null == isPracticed
          ? _value.isPracticed
          : isPracticed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatImplCopyWith<$Res>
    implements $UserStatCopyWith<$Res> {
  factory _$$UserStatImplCopyWith(
          _$UserStatImpl value, $Res Function(_$UserStatImpl) then) =
      __$$UserStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "user_id") int userId,
      int level,
      int song,
      @JsonKey(name: "pre_level") bool preLevel,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'is_practiced') bool isPracticed});
}

/// @nodoc
class __$$UserStatImplCopyWithImpl<$Res>
    extends _$UserStatCopyWithImpl<$Res, _$UserStatImpl>
    implements _$$UserStatImplCopyWith<$Res> {
  __$$UserStatImplCopyWithImpl(
      _$UserStatImpl _value, $Res Function(_$UserStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? level = null,
    Object? song = null,
    Object? preLevel = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isPracticed = null,
  }) {
    return _then(_$UserStatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      preLevel: null == preLevel
          ? _value.preLevel
          : preLevel // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isPracticed: null == isPracticed
          ? _value.isPracticed
          : isPracticed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatImpl implements _UserStat {
  _$UserStatImpl(
      {required this.id,
      @JsonKey(name: "user_id") required this.userId,
      required this.level,
      required this.song,
      @JsonKey(name: "pre_level") required this.preLevel,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'is_practiced') required this.isPracticed});

  factory _$UserStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "user_id")
  final int userId;
  @override
  final int level;
  @override
  final int song;
  @override
  @JsonKey(name: "pre_level")
  final bool preLevel;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'is_practiced')
  final bool isPracticed;

  @override
  String toString() {
    return 'UserStat(id: $id, userId: $userId, level: $level, song: $song, preLevel: $preLevel, createdAt: $createdAt, updatedAt: $updatedAt, isPracticed: $isPracticed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.preLevel, preLevel) ||
                other.preLevel == preLevel) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isPracticed, isPracticed) ||
                other.isPracticed == isPracticed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, level, song,
      preLevel, createdAt, updatedAt, isPracticed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      __$$UserStatImplCopyWithImpl<_$UserStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatImplToJson(
      this,
    );
  }
}

abstract class _UserStat implements UserStat {
  factory _UserStat(
          {required final int id,
          @JsonKey(name: "user_id") required final int userId,
          required final int level,
          required final int song,
          @JsonKey(name: "pre_level") required final bool preLevel,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'is_practiced') required final bool isPracticed}) =
      _$UserStatImpl;

  factory _UserStat.fromJson(Map<String, dynamic> json) =
      _$UserStatImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "user_id")
  int get userId;
  @override
  int get level;
  @override
  int get song;
  @override
  @JsonKey(name: "pre_level")
  bool get preLevel;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'is_practiced')
  bool get isPracticed;
  @override
  @JsonKey(ignore: true)
  _$$UserStatImplCopyWith<_$UserStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserStat _$UpdateUserStatFromJson(Map<String, dynamic> json) {
  return _UpdateUserStat.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserStat {
  int? get song => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  @JsonKey(name: "pre_level")
  bool? get preLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_practiced')
  bool? get isPracticed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateUserStatCopyWith<UpdateUserStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserStatCopyWith<$Res> {
  factory $UpdateUserStatCopyWith(
          UpdateUserStat value, $Res Function(UpdateUserStat) then) =
      _$UpdateUserStatCopyWithImpl<$Res, UpdateUserStat>;
  @useResult
  $Res call(
      {int? song,
      int? level,
      @JsonKey(name: "pre_level") bool? preLevel,
      @JsonKey(name: 'is_practiced') bool? isPracticed});
}

/// @nodoc
class _$UpdateUserStatCopyWithImpl<$Res, $Val extends UpdateUserStat>
    implements $UpdateUserStatCopyWith<$Res> {
  _$UpdateUserStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = freezed,
    Object? level = freezed,
    Object? preLevel = freezed,
    Object? isPracticed = freezed,
  }) {
    return _then(_value.copyWith(
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      preLevel: freezed == preLevel
          ? _value.preLevel
          : preLevel // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPracticed: freezed == isPracticed
          ? _value.isPracticed
          : isPracticed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserStatImplCopyWith<$Res>
    implements $UpdateUserStatCopyWith<$Res> {
  factory _$$UpdateUserStatImplCopyWith(_$UpdateUserStatImpl value,
          $Res Function(_$UpdateUserStatImpl) then) =
      __$$UpdateUserStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? song,
      int? level,
      @JsonKey(name: "pre_level") bool? preLevel,
      @JsonKey(name: 'is_practiced') bool? isPracticed});
}

/// @nodoc
class __$$UpdateUserStatImplCopyWithImpl<$Res>
    extends _$UpdateUserStatCopyWithImpl<$Res, _$UpdateUserStatImpl>
    implements _$$UpdateUserStatImplCopyWith<$Res> {
  __$$UpdateUserStatImplCopyWithImpl(
      _$UpdateUserStatImpl _value, $Res Function(_$UpdateUserStatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? song = freezed,
    Object? level = freezed,
    Object? preLevel = freezed,
    Object? isPracticed = freezed,
  }) {
    return _then(_$UpdateUserStatImpl(
      song: freezed == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      preLevel: freezed == preLevel
          ? _value.preLevel
          : preLevel // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPracticed: freezed == isPracticed
          ? _value.isPracticed
          : isPracticed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserStatImpl implements _UpdateUserStat {
  _$UpdateUserStatImpl(
      {this.song,
      this.level,
      @JsonKey(name: "pre_level") this.preLevel,
      @JsonKey(name: 'is_practiced') this.isPracticed});

  factory _$UpdateUserStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserStatImplFromJson(json);

  @override
  final int? song;
  @override
  final int? level;
  @override
  @JsonKey(name: "pre_level")
  final bool? preLevel;
  @override
  @JsonKey(name: 'is_practiced')
  final bool? isPracticed;

  @override
  String toString() {
    return 'UpdateUserStat(song: $song, level: $level, preLevel: $preLevel, isPracticed: $isPracticed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserStatImpl &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.preLevel, preLevel) ||
                other.preLevel == preLevel) &&
            (identical(other.isPracticed, isPracticed) ||
                other.isPracticed == isPracticed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, song, level, preLevel, isPracticed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserStatImplCopyWith<_$UpdateUserStatImpl> get copyWith =>
      __$$UpdateUserStatImplCopyWithImpl<_$UpdateUserStatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserStatImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserStat implements UpdateUserStat {
  factory _UpdateUserStat(
          {final int? song,
          final int? level,
          @JsonKey(name: "pre_level") final bool? preLevel,
          @JsonKey(name: 'is_practiced') final bool? isPracticed}) =
      _$UpdateUserStatImpl;

  factory _UpdateUserStat.fromJson(Map<String, dynamic> json) =
      _$UpdateUserStatImpl.fromJson;

  @override
  int? get song;
  @override
  int? get level;
  @override
  @JsonKey(name: "pre_level")
  bool? get preLevel;
  @override
  @JsonKey(name: 'is_practiced')
  bool? get isPracticed;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUserStatImplCopyWith<_$UpdateUserStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
