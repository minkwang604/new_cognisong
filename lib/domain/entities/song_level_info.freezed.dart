// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_level_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongLevelInfo _$SongLevelInfoFromJson(Map<String, dynamic> json) {
  return _SongLevelInfo.fromJson(json);
}

/// @nodoc
mixin _$SongLevelInfo {
  int get count => throw _privateConstructorUsedError;
  bool get isInitConsonant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongLevelInfoCopyWith<SongLevelInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongLevelInfoCopyWith<$Res> {
  factory $SongLevelInfoCopyWith(
          SongLevelInfo value, $Res Function(SongLevelInfo) then) =
      _$SongLevelInfoCopyWithImpl<$Res, SongLevelInfo>;
  @useResult
  $Res call({int count, bool isInitConsonant});
}

/// @nodoc
class _$SongLevelInfoCopyWithImpl<$Res, $Val extends SongLevelInfo>
    implements $SongLevelInfoCopyWith<$Res> {
  _$SongLevelInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isInitConsonant = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isInitConsonant: null == isInitConsonant
          ? _value.isInitConsonant
          : isInitConsonant // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongLevelInfoImplCopyWith<$Res>
    implements $SongLevelInfoCopyWith<$Res> {
  factory _$$SongLevelInfoImplCopyWith(
          _$SongLevelInfoImpl value, $Res Function(_$SongLevelInfoImpl) then) =
      __$$SongLevelInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, bool isInitConsonant});
}

/// @nodoc
class __$$SongLevelInfoImplCopyWithImpl<$Res>
    extends _$SongLevelInfoCopyWithImpl<$Res, _$SongLevelInfoImpl>
    implements _$$SongLevelInfoImplCopyWith<$Res> {
  __$$SongLevelInfoImplCopyWithImpl(
      _$SongLevelInfoImpl _value, $Res Function(_$SongLevelInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? isInitConsonant = null,
  }) {
    return _then(_$SongLevelInfoImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      isInitConsonant: null == isInitConsonant
          ? _value.isInitConsonant
          : isInitConsonant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongLevelInfoImpl implements _SongLevelInfo {
  _$SongLevelInfoImpl({required this.count, required this.isInitConsonant});

  factory _$SongLevelInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongLevelInfoImplFromJson(json);

  @override
  final int count;
  @override
  final bool isInitConsonant;

  @override
  String toString() {
    return 'SongLevelInfo(count: $count, isInitConsonant: $isInitConsonant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongLevelInfoImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isInitConsonant, isInitConsonant) ||
                other.isInitConsonant == isInitConsonant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, isInitConsonant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongLevelInfoImplCopyWith<_$SongLevelInfoImpl> get copyWith =>
      __$$SongLevelInfoImplCopyWithImpl<_$SongLevelInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongLevelInfoImplToJson(
      this,
    );
  }
}

abstract class _SongLevelInfo implements SongLevelInfo {
  factory _SongLevelInfo(
      {required final int count,
      required final bool isInitConsonant}) = _$SongLevelInfoImpl;

  factory _SongLevelInfo.fromJson(Map<String, dynamic> json) =
      _$SongLevelInfoImpl.fromJson;

  @override
  int get count;
  @override
  bool get isInitConsonant;
  @override
  @JsonKey(ignore: true)
  _$$SongLevelInfoImplCopyWith<_$SongLevelInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
