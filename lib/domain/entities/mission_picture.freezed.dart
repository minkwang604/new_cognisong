// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MissionPicture _$MissionPictureFromJson(Map<String, dynamic> json) {
  return _MissionPicture.fromJson(json);
}

/// @nodoc
mixin _$MissionPicture {
  num get similarity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionPictureCopyWith<MissionPicture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionPictureCopyWith<$Res> {
  factory $MissionPictureCopyWith(
          MissionPicture value, $Res Function(MissionPicture) then) =
      _$MissionPictureCopyWithImpl<$Res, MissionPicture>;
  @useResult
  $Res call({num similarity});
}

/// @nodoc
class _$MissionPictureCopyWithImpl<$Res, $Val extends MissionPicture>
    implements $MissionPictureCopyWith<$Res> {
  _$MissionPictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarity = null,
  }) {
    return _then(_value.copyWith(
      similarity: null == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissionPictureImplCopyWith<$Res>
    implements $MissionPictureCopyWith<$Res> {
  factory _$$MissionPictureImplCopyWith(_$MissionPictureImpl value,
          $Res Function(_$MissionPictureImpl) then) =
      __$$MissionPictureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num similarity});
}

/// @nodoc
class __$$MissionPictureImplCopyWithImpl<$Res>
    extends _$MissionPictureCopyWithImpl<$Res, _$MissionPictureImpl>
    implements _$$MissionPictureImplCopyWith<$Res> {
  __$$MissionPictureImplCopyWithImpl(
      _$MissionPictureImpl _value, $Res Function(_$MissionPictureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarity = null,
  }) {
    return _then(_$MissionPictureImpl(
      similarity: null == similarity
          ? _value.similarity
          : similarity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionPictureImpl implements _MissionPicture {
  _$MissionPictureImpl({required this.similarity});

  factory _$MissionPictureImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionPictureImplFromJson(json);

  @override
  final num similarity;

  @override
  String toString() {
    return 'MissionPicture(similarity: $similarity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionPictureImpl &&
            (identical(other.similarity, similarity) ||
                other.similarity == similarity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, similarity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionPictureImplCopyWith<_$MissionPictureImpl> get copyWith =>
      __$$MissionPictureImplCopyWithImpl<_$MissionPictureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionPictureImplToJson(
      this,
    );
  }
}

abstract class _MissionPicture implements MissionPicture {
  factory _MissionPicture({required final num similarity}) =
      _$MissionPictureImpl;

  factory _MissionPicture.fromJson(Map<String, dynamic> json) =
      _$MissionPictureImpl.fromJson;

  @override
  num get similarity;
  @override
  @JsonKey(ignore: true)
  _$$MissionPictureImplCopyWith<_$MissionPictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
