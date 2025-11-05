// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_audio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MissionAudio _$MissionAudioFromJson(Map<String, dynamic> json) {
  return _MissionAudio.fromJson(json);
}

/// @nodoc
mixin _$MissionAudio {
  @JsonKey(name: 'audio_text')
  String get audioText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionAudioCopyWith<MissionAudio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionAudioCopyWith<$Res> {
  factory $MissionAudioCopyWith(
          MissionAudio value, $Res Function(MissionAudio) then) =
      _$MissionAudioCopyWithImpl<$Res, MissionAudio>;
  @useResult
  $Res call({@JsonKey(name: 'audio_text') String audioText});
}

/// @nodoc
class _$MissionAudioCopyWithImpl<$Res, $Val extends MissionAudio>
    implements $MissionAudioCopyWith<$Res> {
  _$MissionAudioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioText = null,
  }) {
    return _then(_value.copyWith(
      audioText: null == audioText
          ? _value.audioText
          : audioText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissionAudioImplCopyWith<$Res>
    implements $MissionAudioCopyWith<$Res> {
  factory _$$MissionAudioImplCopyWith(
          _$MissionAudioImpl value, $Res Function(_$MissionAudioImpl) then) =
      __$$MissionAudioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'audio_text') String audioText});
}

/// @nodoc
class __$$MissionAudioImplCopyWithImpl<$Res>
    extends _$MissionAudioCopyWithImpl<$Res, _$MissionAudioImpl>
    implements _$$MissionAudioImplCopyWith<$Res> {
  __$$MissionAudioImplCopyWithImpl(
      _$MissionAudioImpl _value, $Res Function(_$MissionAudioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioText = null,
  }) {
    return _then(_$MissionAudioImpl(
      audioText: null == audioText
          ? _value.audioText
          : audioText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionAudioImpl implements _MissionAudio {
  _$MissionAudioImpl({@JsonKey(name: 'audio_text') required this.audioText});

  factory _$MissionAudioImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionAudioImplFromJson(json);

  @override
  @JsonKey(name: 'audio_text')
  final String audioText;

  @override
  String toString() {
    return 'MissionAudio(audioText: $audioText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionAudioImpl &&
            (identical(other.audioText, audioText) ||
                other.audioText == audioText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, audioText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionAudioImplCopyWith<_$MissionAudioImpl> get copyWith =>
      __$$MissionAudioImplCopyWithImpl<_$MissionAudioImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionAudioImplToJson(
      this,
    );
  }
}

abstract class _MissionAudio implements MissionAudio {
  factory _MissionAudio(
          {@JsonKey(name: 'audio_text') required final String audioText}) =
      _$MissionAudioImpl;

  factory _MissionAudio.fromJson(Map<String, dynamic> json) =
      _$MissionAudioImpl.fromJson;

  @override
  @JsonKey(name: 'audio_text')
  String get audioText;
  @override
  @JsonKey(ignore: true)
  _$$MissionAudioImplCopyWith<_$MissionAudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
