// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_song_first_completed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSongFirstCompleted _$UserSongFirstCompletedFromJson(
    Map<String, dynamic> json) {
  return _UserSongFirstCompleted.fromJson(json);
}

/// @nodoc
mixin _$UserSongFirstCompleted {
  @JsonKey(name: 'is_first_Mission_Completed')
  bool get isFirstMissionCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSongFirstCompletedCopyWith<UserSongFirstCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSongFirstCompletedCopyWith<$Res> {
  factory $UserSongFirstCompletedCopyWith(UserSongFirstCompleted value,
          $Res Function(UserSongFirstCompleted) then) =
      _$UserSongFirstCompletedCopyWithImpl<$Res, UserSongFirstCompleted>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_first_Mission_Completed')
      bool isFirstMissionCompleted});
}

/// @nodoc
class _$UserSongFirstCompletedCopyWithImpl<$Res,
        $Val extends UserSongFirstCompleted>
    implements $UserSongFirstCompletedCopyWith<$Res> {
  _$UserSongFirstCompletedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstMissionCompleted = null,
  }) {
    return _then(_value.copyWith(
      isFirstMissionCompleted: null == isFirstMissionCompleted
          ? _value.isFirstMissionCompleted
          : isFirstMissionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSongFirstCompletedImplCopyWith<$Res>
    implements $UserSongFirstCompletedCopyWith<$Res> {
  factory _$$UserSongFirstCompletedImplCopyWith(
          _$UserSongFirstCompletedImpl value,
          $Res Function(_$UserSongFirstCompletedImpl) then) =
      __$$UserSongFirstCompletedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_first_Mission_Completed')
      bool isFirstMissionCompleted});
}

/// @nodoc
class __$$UserSongFirstCompletedImplCopyWithImpl<$Res>
    extends _$UserSongFirstCompletedCopyWithImpl<$Res,
        _$UserSongFirstCompletedImpl>
    implements _$$UserSongFirstCompletedImplCopyWith<$Res> {
  __$$UserSongFirstCompletedImplCopyWithImpl(
      _$UserSongFirstCompletedImpl _value,
      $Res Function(_$UserSongFirstCompletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFirstMissionCompleted = null,
  }) {
    return _then(_$UserSongFirstCompletedImpl(
      isFirstMissionCompleted: null == isFirstMissionCompleted
          ? _value.isFirstMissionCompleted
          : isFirstMissionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSongFirstCompletedImpl implements _UserSongFirstCompleted {
  _$UserSongFirstCompletedImpl(
      {@JsonKey(name: 'is_first_Mission_Completed')
      required this.isFirstMissionCompleted});

  factory _$UserSongFirstCompletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSongFirstCompletedImplFromJson(json);

  @override
  @JsonKey(name: 'is_first_Mission_Completed')
  final bool isFirstMissionCompleted;

  @override
  String toString() {
    return 'UserSongFirstCompleted(isFirstMissionCompleted: $isFirstMissionCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSongFirstCompletedImpl &&
            (identical(
                    other.isFirstMissionCompleted, isFirstMissionCompleted) ||
                other.isFirstMissionCompleted == isFirstMissionCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFirstMissionCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSongFirstCompletedImplCopyWith<_$UserSongFirstCompletedImpl>
      get copyWith => __$$UserSongFirstCompletedImplCopyWithImpl<
          _$UserSongFirstCompletedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSongFirstCompletedImplToJson(
      this,
    );
  }
}

abstract class _UserSongFirstCompleted implements UserSongFirstCompleted {
  factory _UserSongFirstCompleted(
          {@JsonKey(name: 'is_first_Mission_Completed')
          required final bool isFirstMissionCompleted}) =
      _$UserSongFirstCompletedImpl;

  factory _UserSongFirstCompleted.fromJson(Map<String, dynamic> json) =
      _$UserSongFirstCompletedImpl.fromJson;

  @override
  @JsonKey(name: 'is_first_Mission_Completed')
  bool get isFirstMissionCompleted;
  @override
  @JsonKey(ignore: true)
  _$$UserSongFirstCompletedImplCopyWith<_$UserSongFirstCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
