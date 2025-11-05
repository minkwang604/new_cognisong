// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_lyric_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongLyricInfo _$SongLyricInfoFromJson(Map<String, dynamic> json) {
  return _SongLyricInfo.fromJson(json);
}

/// @nodoc
mixin _$SongLyricInfo {
  int get total => throw _privateConstructorUsedError;
  Map<int, String> get changeLyric => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongLyricInfoCopyWith<SongLyricInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongLyricInfoCopyWith<$Res> {
  factory $SongLyricInfoCopyWith(
          SongLyricInfo value, $Res Function(SongLyricInfo) then) =
      _$SongLyricInfoCopyWithImpl<$Res, SongLyricInfo>;
  @useResult
  $Res call({int total, Map<int, String> changeLyric});
}

/// @nodoc
class _$SongLyricInfoCopyWithImpl<$Res, $Val extends SongLyricInfo>
    implements $SongLyricInfoCopyWith<$Res> {
  _$SongLyricInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? changeLyric = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      changeLyric: null == changeLyric
          ? _value.changeLyric
          : changeLyric // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongLyricInfoImplCopyWith<$Res>
    implements $SongLyricInfoCopyWith<$Res> {
  factory _$$SongLyricInfoImplCopyWith(
          _$SongLyricInfoImpl value, $Res Function(_$SongLyricInfoImpl) then) =
      __$$SongLyricInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, Map<int, String> changeLyric});
}

/// @nodoc
class __$$SongLyricInfoImplCopyWithImpl<$Res>
    extends _$SongLyricInfoCopyWithImpl<$Res, _$SongLyricInfoImpl>
    implements _$$SongLyricInfoImplCopyWith<$Res> {
  __$$SongLyricInfoImplCopyWithImpl(
      _$SongLyricInfoImpl _value, $Res Function(_$SongLyricInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? changeLyric = null,
  }) {
    return _then(_$SongLyricInfoImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      changeLyric: null == changeLyric
          ? _value._changeLyric
          : changeLyric // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongLyricInfoImpl implements _SongLyricInfo {
  _$SongLyricInfoImpl(
      {required this.total, required final Map<int, String> changeLyric})
      : _changeLyric = changeLyric;

  factory _$SongLyricInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongLyricInfoImplFromJson(json);

  @override
  final int total;
  final Map<int, String> _changeLyric;
  @override
  Map<int, String> get changeLyric {
    if (_changeLyric is EqualUnmodifiableMapView) return _changeLyric;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_changeLyric);
  }

  @override
  String toString() {
    return 'SongLyricInfo(total: $total, changeLyric: $changeLyric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongLyricInfoImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._changeLyric, _changeLyric));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_changeLyric));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongLyricInfoImplCopyWith<_$SongLyricInfoImpl> get copyWith =>
      __$$SongLyricInfoImplCopyWithImpl<_$SongLyricInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongLyricInfoImplToJson(
      this,
    );
  }
}

abstract class _SongLyricInfo implements SongLyricInfo {
  factory _SongLyricInfo(
      {required final int total,
      required final Map<int, String> changeLyric}) = _$SongLyricInfoImpl;

  factory _SongLyricInfo.fromJson(Map<String, dynamic> json) =
      _$SongLyricInfoImpl.fromJson;

  @override
  int get total;
  @override
  Map<int, String> get changeLyric;
  @override
  @JsonKey(ignore: true)
  _$$SongLyricInfoImplCopyWith<_$SongLyricInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
