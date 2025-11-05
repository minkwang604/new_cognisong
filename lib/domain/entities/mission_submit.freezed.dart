// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission_submit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MissionSubmit _$MissionSubmitFromJson(Map<String, dynamic> json) {
  return _MissionSubmit.fromJson(json);
}

/// @nodoc
mixin _$MissionSubmit {
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mission_word')
  Map<String, String> get missionWord => throw _privateConstructorUsedError;
  int get song => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_text')
  String? get audioText => throw _privateConstructorUsedError;
  @JsonKey(name: 'picture_score')
  Map<String, num>? get pictureScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_test')
  bool? get isTest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionSubmitCopyWith<MissionSubmit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionSubmitCopyWith<$Res> {
  factory $MissionSubmitCopyWith(
          MissionSubmit value, $Res Function(MissionSubmit) then) =
      _$MissionSubmitCopyWithImpl<$Res, MissionSubmit>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'mission_word') Map<String, String> missionWord,
      int song,
      @JsonKey(name: 'audio_text') String? audioText,
      @JsonKey(name: 'picture_score') Map<String, num>? pictureScore,
      @JsonKey(name: 'created_at') DateTime createdAt,
      int order,
      @JsonKey(name: 'is_test') bool? isTest});
}

/// @nodoc
class _$MissionSubmitCopyWithImpl<$Res, $Val extends MissionSubmit>
    implements $MissionSubmitCopyWith<$Res> {
  _$MissionSubmitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? missionWord = null,
    Object? song = null,
    Object? audioText = freezed,
    Object? pictureScore = freezed,
    Object? createdAt = null,
    Object? order = null,
    Object? isTest = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      missionWord: null == missionWord
          ? _value.missionWord
          : missionWord // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      audioText: freezed == audioText
          ? _value.audioText
          : audioText // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureScore: freezed == pictureScore
          ? _value.pictureScore
          : pictureScore // ignore: cast_nullable_to_non_nullable
              as Map<String, num>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isTest: freezed == isTest
          ? _value.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissionSubmitImplCopyWith<$Res>
    implements $MissionSubmitCopyWith<$Res> {
  factory _$$MissionSubmitImplCopyWith(
          _$MissionSubmitImpl value, $Res Function(_$MissionSubmitImpl) then) =
      __$$MissionSubmitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String type,
      @JsonKey(name: 'mission_word') Map<String, String> missionWord,
      int song,
      @JsonKey(name: 'audio_text') String? audioText,
      @JsonKey(name: 'picture_score') Map<String, num>? pictureScore,
      @JsonKey(name: 'created_at') DateTime createdAt,
      int order,
      @JsonKey(name: 'is_test') bool? isTest});
}

/// @nodoc
class __$$MissionSubmitImplCopyWithImpl<$Res>
    extends _$MissionSubmitCopyWithImpl<$Res, _$MissionSubmitImpl>
    implements _$$MissionSubmitImplCopyWith<$Res> {
  __$$MissionSubmitImplCopyWithImpl(
      _$MissionSubmitImpl _value, $Res Function(_$MissionSubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? missionWord = null,
    Object? song = null,
    Object? audioText = freezed,
    Object? pictureScore = freezed,
    Object? createdAt = null,
    Object? order = null,
    Object? isTest = freezed,
  }) {
    return _then(_$MissionSubmitImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      missionWord: null == missionWord
          ? _value._missionWord
          : missionWord // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      audioText: freezed == audioText
          ? _value.audioText
          : audioText // ignore: cast_nullable_to_non_nullable
              as String?,
      pictureScore: freezed == pictureScore
          ? _value._pictureScore
          : pictureScore // ignore: cast_nullable_to_non_nullable
              as Map<String, num>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isTest: freezed == isTest
          ? _value.isTest
          : isTest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionSubmitImpl implements _MissionSubmit {
  _$MissionSubmitImpl(
      {@JsonKey(name: 'type') this.type = 'pre',
      @JsonKey(name: 'mission_word')
      required final Map<String, String> missionWord,
      required this.song,
      @JsonKey(name: 'audio_text') this.audioText,
      @JsonKey(name: 'picture_score') final Map<String, num>? pictureScore,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.order,
      @JsonKey(name: 'is_test') this.isTest})
      : _missionWord = missionWord,
        _pictureScore = pictureScore;

  factory _$MissionSubmitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionSubmitImplFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String type;
  final Map<String, String> _missionWord;
  @override
  @JsonKey(name: 'mission_word')
  Map<String, String> get missionWord {
    if (_missionWord is EqualUnmodifiableMapView) return _missionWord;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_missionWord);
  }

  @override
  final int song;
  @override
  @JsonKey(name: 'audio_text')
  final String? audioText;
  final Map<String, num>? _pictureScore;
  @override
  @JsonKey(name: 'picture_score')
  Map<String, num>? get pictureScore {
    final value = _pictureScore;
    if (value == null) return null;
    if (_pictureScore is EqualUnmodifiableMapView) return _pictureScore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final int order;
  @override
  @JsonKey(name: 'is_test')
  final bool? isTest;

  @override
  String toString() {
    return 'MissionSubmit(type: $type, missionWord: $missionWord, song: $song, audioText: $audioText, pictureScore: $pictureScore, createdAt: $createdAt, order: $order, isTest: $isTest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionSubmitImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._missionWord, _missionWord) &&
            (identical(other.song, song) || other.song == song) &&
            (identical(other.audioText, audioText) ||
                other.audioText == audioText) &&
            const DeepCollectionEquality()
                .equals(other._pictureScore, _pictureScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isTest, isTest) || other.isTest == isTest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_missionWord),
      song,
      audioText,
      const DeepCollectionEquality().hash(_pictureScore),
      createdAt,
      order,
      isTest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionSubmitImplCopyWith<_$MissionSubmitImpl> get copyWith =>
      __$$MissionSubmitImplCopyWithImpl<_$MissionSubmitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionSubmitImplToJson(
      this,
    );
  }
}

abstract class _MissionSubmit implements MissionSubmit {
  factory _MissionSubmit(
      {@JsonKey(name: 'type') final String type,
      @JsonKey(name: 'mission_word')
      required final Map<String, String> missionWord,
      required final int song,
      @JsonKey(name: 'audio_text') final String? audioText,
      @JsonKey(name: 'picture_score') final Map<String, num>? pictureScore,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final int order,
      @JsonKey(name: 'is_test') final bool? isTest}) = _$MissionSubmitImpl;

  factory _MissionSubmit.fromJson(Map<String, dynamic> json) =
      _$MissionSubmitImpl.fromJson;

  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'mission_word')
  Map<String, String> get missionWord;
  @override
  int get song;
  @override
  @JsonKey(name: 'audio_text')
  String? get audioText;
  @override
  @JsonKey(name: 'picture_score')
  Map<String, num>? get pictureScore;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  int get order;
  @override
  @JsonKey(name: 'is_test')
  bool? get isTest;
  @override
  @JsonKey(ignore: true)
  _$$MissionSubmitImplCopyWith<_$MissionSubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MissionSubmitResponse _$MissionSubmitResponseFromJson(
    Map<String, dynamic> json) {
  return _MissionSubmitResponse.fromJson(json);
}

/// @nodoc
mixin _$MissionSubmitResponse {
  num get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionSubmitResponseCopyWith<MissionSubmitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionSubmitResponseCopyWith<$Res> {
  factory $MissionSubmitResponseCopyWith(MissionSubmitResponse value,
          $Res Function(MissionSubmitResponse) then) =
      _$MissionSubmitResponseCopyWithImpl<$Res, MissionSubmitResponse>;
  @useResult
  $Res call({num score});
}

/// @nodoc
class _$MissionSubmitResponseCopyWithImpl<$Res,
        $Val extends MissionSubmitResponse>
    implements $MissionSubmitResponseCopyWith<$Res> {
  _$MissionSubmitResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissionSubmitResponseImplCopyWith<$Res>
    implements $MissionSubmitResponseCopyWith<$Res> {
  factory _$$MissionSubmitResponseImplCopyWith(
          _$MissionSubmitResponseImpl value,
          $Res Function(_$MissionSubmitResponseImpl) then) =
      __$$MissionSubmitResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num score});
}

/// @nodoc
class __$$MissionSubmitResponseImplCopyWithImpl<$Res>
    extends _$MissionSubmitResponseCopyWithImpl<$Res,
        _$MissionSubmitResponseImpl>
    implements _$$MissionSubmitResponseImplCopyWith<$Res> {
  __$$MissionSubmitResponseImplCopyWithImpl(_$MissionSubmitResponseImpl _value,
      $Res Function(_$MissionSubmitResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
  }) {
    return _then(_$MissionSubmitResponseImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionSubmitResponseImpl implements _MissionSubmitResponse {
  _$MissionSubmitResponseImpl({required this.score});

  factory _$MissionSubmitResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionSubmitResponseImplFromJson(json);

  @override
  final num score;

  @override
  String toString() {
    return 'MissionSubmitResponse(score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionSubmitResponseImpl &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionSubmitResponseImplCopyWith<_$MissionSubmitResponseImpl>
      get copyWith => __$$MissionSubmitResponseImplCopyWithImpl<
          _$MissionSubmitResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionSubmitResponseImplToJson(
      this,
    );
  }
}

abstract class _MissionSubmitResponse implements MissionSubmitResponse {
  factory _MissionSubmitResponse({required final num score}) =
      _$MissionSubmitResponseImpl;

  factory _MissionSubmitResponse.fromJson(Map<String, dynamic> json) =
      _$MissionSubmitResponseImpl.fromJson;

  @override
  num get score;
  @override
  @JsonKey(ignore: true)
  _$$MissionSubmitResponseImplCopyWith<_$MissionSubmitResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
