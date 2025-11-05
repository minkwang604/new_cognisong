// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_parse_mr.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongParseMr _$SongParseMrFromJson(Map<String, dynamic> json) {
  return _SongParseMr.fromJson(json);
}

/// @nodoc
mixin _$SongParseMr {
  int get id => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  @JsonKey(name: 'song_id')
  int get songId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mr_url')
  String get mrUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "vtt_url")
  String get vttUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongParseMrCopyWith<SongParseMr> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongParseMrCopyWith<$Res> {
  factory $SongParseMrCopyWith(
          SongParseMr value, $Res Function(SongParseMr) then) =
      _$SongParseMrCopyWithImpl<$Res, SongParseMr>;
  @useResult
  $Res call(
      {int id,
      int step,
      @JsonKey(name: 'song_id') int songId,
      @JsonKey(name: 'mr_url') String mrUrl,
      @JsonKey(name: "vtt_url") String vttUrl});
}

/// @nodoc
class _$SongParseMrCopyWithImpl<$Res, $Val extends SongParseMr>
    implements $SongParseMrCopyWith<$Res> {
  _$SongParseMrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = null,
    Object? songId = null,
    Object? mrUrl = null,
    Object? vttUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      mrUrl: null == mrUrl
          ? _value.mrUrl
          : mrUrl // ignore: cast_nullable_to_non_nullable
              as String,
      vttUrl: null == vttUrl
          ? _value.vttUrl
          : vttUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongParseMrImplCopyWith<$Res>
    implements $SongParseMrCopyWith<$Res> {
  factory _$$SongParseMrImplCopyWith(
          _$SongParseMrImpl value, $Res Function(_$SongParseMrImpl) then) =
      __$$SongParseMrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int step,
      @JsonKey(name: 'song_id') int songId,
      @JsonKey(name: 'mr_url') String mrUrl,
      @JsonKey(name: "vtt_url") String vttUrl});
}

/// @nodoc
class __$$SongParseMrImplCopyWithImpl<$Res>
    extends _$SongParseMrCopyWithImpl<$Res, _$SongParseMrImpl>
    implements _$$SongParseMrImplCopyWith<$Res> {
  __$$SongParseMrImplCopyWithImpl(
      _$SongParseMrImpl _value, $Res Function(_$SongParseMrImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? step = null,
    Object? songId = null,
    Object? mrUrl = null,
    Object? vttUrl = null,
  }) {
    return _then(_$SongParseMrImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      mrUrl: null == mrUrl
          ? _value.mrUrl
          : mrUrl // ignore: cast_nullable_to_non_nullable
              as String,
      vttUrl: null == vttUrl
          ? _value.vttUrl
          : vttUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongParseMrImpl implements _SongParseMr {
  _$SongParseMrImpl(
      {required this.id,
      required this.step,
      @JsonKey(name: 'song_id') required this.songId,
      @JsonKey(name: 'mr_url') required this.mrUrl,
      @JsonKey(name: "vtt_url") required this.vttUrl});

  factory _$SongParseMrImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongParseMrImplFromJson(json);

  @override
  final int id;
  @override
  final int step;
  @override
  @JsonKey(name: 'song_id')
  final int songId;
  @override
  @JsonKey(name: 'mr_url')
  final String mrUrl;
  @override
  @JsonKey(name: "vtt_url")
  final String vttUrl;

  @override
  String toString() {
    return 'SongParseMr(id: $id, step: $step, songId: $songId, mrUrl: $mrUrl, vttUrl: $vttUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongParseMrImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.mrUrl, mrUrl) || other.mrUrl == mrUrl) &&
            (identical(other.vttUrl, vttUrl) || other.vttUrl == vttUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, step, songId, mrUrl, vttUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongParseMrImplCopyWith<_$SongParseMrImpl> get copyWith =>
      __$$SongParseMrImplCopyWithImpl<_$SongParseMrImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongParseMrImplToJson(
      this,
    );
  }
}

abstract class _SongParseMr implements SongParseMr {
  factory _SongParseMr(
          {required final int id,
          required final int step,
          @JsonKey(name: 'song_id') required final int songId,
          @JsonKey(name: 'mr_url') required final String mrUrl,
          @JsonKey(name: "vtt_url") required final String vttUrl}) =
      _$SongParseMrImpl;

  factory _SongParseMr.fromJson(Map<String, dynamic> json) =
      _$SongParseMrImpl.fromJson;

  @override
  int get id;
  @override
  int get step;
  @override
  @JsonKey(name: 'song_id')
  int get songId;
  @override
  @JsonKey(name: 'mr_url')
  String get mrUrl;
  @override
  @JsonKey(name: "vtt_url")
  String get vttUrl;
  @override
  @JsonKey(ignore: true)
  _$$SongParseMrImplCopyWith<_$SongParseMrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SongParseMrList _$SongParseMrListFromJson(Map<String, dynamic> json) {
  return _SongParseMrList.fromJson(json);
}

/// @nodoc
mixin _$SongParseMrList {
  List<SongParseMr> get songParseMrList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongParseMrListCopyWith<SongParseMrList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongParseMrListCopyWith<$Res> {
  factory $SongParseMrListCopyWith(
          SongParseMrList value, $Res Function(SongParseMrList) then) =
      _$SongParseMrListCopyWithImpl<$Res, SongParseMrList>;
  @useResult
  $Res call({List<SongParseMr> songParseMrList});
}

/// @nodoc
class _$SongParseMrListCopyWithImpl<$Res, $Val extends SongParseMrList>
    implements $SongParseMrListCopyWith<$Res> {
  _$SongParseMrListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songParseMrList = null,
  }) {
    return _then(_value.copyWith(
      songParseMrList: null == songParseMrList
          ? _value.songParseMrList
          : songParseMrList // ignore: cast_nullable_to_non_nullable
              as List<SongParseMr>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongParseMrListImplCopyWith<$Res>
    implements $SongParseMrListCopyWith<$Res> {
  factory _$$SongParseMrListImplCopyWith(_$SongParseMrListImpl value,
          $Res Function(_$SongParseMrListImpl) then) =
      __$$SongParseMrListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SongParseMr> songParseMrList});
}

/// @nodoc
class __$$SongParseMrListImplCopyWithImpl<$Res>
    extends _$SongParseMrListCopyWithImpl<$Res, _$SongParseMrListImpl>
    implements _$$SongParseMrListImplCopyWith<$Res> {
  __$$SongParseMrListImplCopyWithImpl(
      _$SongParseMrListImpl _value, $Res Function(_$SongParseMrListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songParseMrList = null,
  }) {
    return _then(_$SongParseMrListImpl(
      songParseMrList: null == songParseMrList
          ? _value._songParseMrList
          : songParseMrList // ignore: cast_nullable_to_non_nullable
              as List<SongParseMr>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongParseMrListImpl implements _SongParseMrList {
  _$SongParseMrListImpl({required final List<SongParseMr> songParseMrList})
      : _songParseMrList = songParseMrList;

  factory _$SongParseMrListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongParseMrListImplFromJson(json);

  final List<SongParseMr> _songParseMrList;
  @override
  List<SongParseMr> get songParseMrList {
    if (_songParseMrList is EqualUnmodifiableListView) return _songParseMrList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songParseMrList);
  }

  @override
  String toString() {
    return 'SongParseMrList(songParseMrList: $songParseMrList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongParseMrListImpl &&
            const DeepCollectionEquality()
                .equals(other._songParseMrList, _songParseMrList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songParseMrList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongParseMrListImplCopyWith<_$SongParseMrListImpl> get copyWith =>
      __$$SongParseMrListImplCopyWithImpl<_$SongParseMrListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongParseMrListImplToJson(
      this,
    );
  }
}

abstract class _SongParseMrList implements SongParseMrList {
  factory _SongParseMrList({required final List<SongParseMr> songParseMrList}) =
      _$SongParseMrListImpl;

  factory _SongParseMrList.fromJson(Map<String, dynamic> json) =
      _$SongParseMrListImpl.fromJson;

  @override
  List<SongParseMr> get songParseMrList;
  @override
  @JsonKey(ignore: true)
  _$$SongParseMrListImplCopyWith<_$SongParseMrListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
