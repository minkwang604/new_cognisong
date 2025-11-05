// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_parse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SongParse _$SongParseFromJson(Map<String, dynamic> json) {
  return _SongParse.fromJson(json);
}

/// @nodoc
mixin _$SongParse {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'song_id')
  int get songId => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: "vtt_url")
  String get vttUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongParseCopyWith<SongParse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongParseCopyWith<$Res> {
  factory $SongParseCopyWith(SongParse value, $Res Function(SongParse) then) =
      _$SongParseCopyWithImpl<$Res, SongParse>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'song_id') int songId,
      int step,
      String url,
      @JsonKey(name: "vtt_url") String vttUrl});
}

/// @nodoc
class _$SongParseCopyWithImpl<$Res, $Val extends SongParse>
    implements $SongParseCopyWith<$Res> {
  _$SongParseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songId = null,
    Object? step = null,
    Object? url = null,
    Object? vttUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      vttUrl: null == vttUrl
          ? _value.vttUrl
          : vttUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongParseImplCopyWith<$Res>
    implements $SongParseCopyWith<$Res> {
  factory _$$SongParseImplCopyWith(
          _$SongParseImpl value, $Res Function(_$SongParseImpl) then) =
      __$$SongParseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'song_id') int songId,
      int step,
      String url,
      @JsonKey(name: "vtt_url") String vttUrl});
}

/// @nodoc
class __$$SongParseImplCopyWithImpl<$Res>
    extends _$SongParseCopyWithImpl<$Res, _$SongParseImpl>
    implements _$$SongParseImplCopyWith<$Res> {
  __$$SongParseImplCopyWithImpl(
      _$SongParseImpl _value, $Res Function(_$SongParseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? songId = null,
    Object? step = null,
    Object? url = null,
    Object? vttUrl = null,
  }) {
    return _then(_$SongParseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
class _$SongParseImpl implements _SongParse {
  _$SongParseImpl(
      {required this.id,
      @JsonKey(name: 'song_id') required this.songId,
      required this.step,
      required this.url,
      @JsonKey(name: "vtt_url") required this.vttUrl});

  factory _$SongParseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongParseImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'song_id')
  final int songId;
  @override
  final int step;
  @override
  final String url;
  @override
  @JsonKey(name: "vtt_url")
  final String vttUrl;

  @override
  String toString() {
    return 'SongParse(id: $id, songId: $songId, step: $step, url: $url, vttUrl: $vttUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongParseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.vttUrl, vttUrl) || other.vttUrl == vttUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, songId, step, url, vttUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongParseImplCopyWith<_$SongParseImpl> get copyWith =>
      __$$SongParseImplCopyWithImpl<_$SongParseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongParseImplToJson(
      this,
    );
  }
}

abstract class _SongParse implements SongParse {
  factory _SongParse(
          {required final int id,
          @JsonKey(name: 'song_id') required final int songId,
          required final int step,
          required final String url,
          @JsonKey(name: "vtt_url") required final String vttUrl}) =
      _$SongParseImpl;

  factory _SongParse.fromJson(Map<String, dynamic> json) =
      _$SongParseImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'song_id')
  int get songId;
  @override
  int get step;
  @override
  String get url;
  @override
  @JsonKey(name: "vtt_url")
  String get vttUrl;
  @override
  @JsonKey(ignore: true)
  _$$SongParseImplCopyWith<_$SongParseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SongParseList _$SongParseListFromJson(Map<String, dynamic> json) {
  return _SongParseList.fromJson(json);
}

/// @nodoc
mixin _$SongParseList {
  List<SongParse> get songParseList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SongParseListCopyWith<SongParseList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongParseListCopyWith<$Res> {
  factory $SongParseListCopyWith(
          SongParseList value, $Res Function(SongParseList) then) =
      _$SongParseListCopyWithImpl<$Res, SongParseList>;
  @useResult
  $Res call({List<SongParse> songParseList});
}

/// @nodoc
class _$SongParseListCopyWithImpl<$Res, $Val extends SongParseList>
    implements $SongParseListCopyWith<$Res> {
  _$SongParseListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songParseList = null,
  }) {
    return _then(_value.copyWith(
      songParseList: null == songParseList
          ? _value.songParseList
          : songParseList // ignore: cast_nullable_to_non_nullable
              as List<SongParse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SongParseListImplCopyWith<$Res>
    implements $SongParseListCopyWith<$Res> {
  factory _$$SongParseListImplCopyWith(
          _$SongParseListImpl value, $Res Function(_$SongParseListImpl) then) =
      __$$SongParseListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SongParse> songParseList});
}

/// @nodoc
class __$$SongParseListImplCopyWithImpl<$Res>
    extends _$SongParseListCopyWithImpl<$Res, _$SongParseListImpl>
    implements _$$SongParseListImplCopyWith<$Res> {
  __$$SongParseListImplCopyWithImpl(
      _$SongParseListImpl _value, $Res Function(_$SongParseListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songParseList = null,
  }) {
    return _then(_$SongParseListImpl(
      songParseList: null == songParseList
          ? _value._songParseList
          : songParseList // ignore: cast_nullable_to_non_nullable
              as List<SongParse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SongParseListImpl implements _SongParseList {
  _$SongParseListImpl({required final List<SongParse> songParseList})
      : _songParseList = songParseList;

  factory _$SongParseListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SongParseListImplFromJson(json);

  final List<SongParse> _songParseList;
  @override
  List<SongParse> get songParseList {
    if (_songParseList is EqualUnmodifiableListView) return _songParseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songParseList);
  }

  @override
  String toString() {
    return 'SongParseList(songParseList: $songParseList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SongParseListImpl &&
            const DeepCollectionEquality()
                .equals(other._songParseList, _songParseList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_songParseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SongParseListImplCopyWith<_$SongParseListImpl> get copyWith =>
      __$$SongParseListImplCopyWithImpl<_$SongParseListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SongParseListImplToJson(
      this,
    );
  }
}

abstract class _SongParseList implements SongParseList {
  factory _SongParseList({required final List<SongParse> songParseList}) =
      _$SongParseListImpl;

  factory _SongParseList.fromJson(Map<String, dynamic> json) =
      _$SongParseListImpl.fromJson;

  @override
  List<SongParse> get songParseList;
  @override
  @JsonKey(ignore: true)
  _$$SongParseListImplCopyWith<_$SongParseListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
