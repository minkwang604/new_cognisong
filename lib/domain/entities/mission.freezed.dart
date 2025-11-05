// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mission _$MissionFromJson(Map<String, dynamic> json) {
  return _Mission.fromJson(json);
}

/// @nodoc
mixin _$Mission {
  String get module => throw _privateConstructorUsedError;
  int get song => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_first_Mission_Completed')
  bool get isFirstMissionCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_user')
  bool get isUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_order')
  int get lastOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MissionCopyWith<Mission> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissionCopyWith<$Res> {
  factory $MissionCopyWith(Mission value, $Res Function(Mission) then) =
      _$MissionCopyWithImpl<$Res, Mission>;
  @useResult
  $Res call(
      {String module,
      int song,
      @JsonKey(name: 'is_first_Mission_Completed') bool isFirstMissionCompleted,
      @JsonKey(name: 'is_user') bool isUser,
      @JsonKey(name: 'last_order') int lastOrder});
}

/// @nodoc
class _$MissionCopyWithImpl<$Res, $Val extends Mission>
    implements $MissionCopyWith<$Res> {
  _$MissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? song = null,
    Object? isFirstMissionCompleted = null,
    Object? isUser = null,
    Object? lastOrder = null,
  }) {
    return _then(_value.copyWith(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstMissionCompleted: null == isFirstMissionCompleted
          ? _value.isFirstMissionCompleted
          : isFirstMissionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrder: null == lastOrder
          ? _value.lastOrder
          : lastOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissionImplCopyWith<$Res> implements $MissionCopyWith<$Res> {
  factory _$$MissionImplCopyWith(
          _$MissionImpl value, $Res Function(_$MissionImpl) then) =
      __$$MissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String module,
      int song,
      @JsonKey(name: 'is_first_Mission_Completed') bool isFirstMissionCompleted,
      @JsonKey(name: 'is_user') bool isUser,
      @JsonKey(name: 'last_order') int lastOrder});
}

/// @nodoc
class __$$MissionImplCopyWithImpl<$Res>
    extends _$MissionCopyWithImpl<$Res, _$MissionImpl>
    implements _$$MissionImplCopyWith<$Res> {
  __$$MissionImplCopyWithImpl(
      _$MissionImpl _value, $Res Function(_$MissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? song = null,
    Object? isFirstMissionCompleted = null,
    Object? isUser = null,
    Object? lastOrder = null,
  }) {
    return _then(_$MissionImpl(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      song: null == song
          ? _value.song
          : song // ignore: cast_nullable_to_non_nullable
              as int,
      isFirstMissionCompleted: null == isFirstMissionCompleted
          ? _value.isFirstMissionCompleted
          : isFirstMissionCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUser: null == isUser
          ? _value.isUser
          : isUser // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOrder: null == lastOrder
          ? _value.lastOrder
          : lastOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MissionImpl implements _Mission {
  _$MissionImpl(
      {required this.module,
      required this.song,
      @JsonKey(name: 'is_first_Mission_Completed')
      required this.isFirstMissionCompleted,
      @JsonKey(name: 'is_user') required this.isUser,
      @JsonKey(name: 'last_order') required this.lastOrder});

  factory _$MissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MissionImplFromJson(json);

  @override
  final String module;
  @override
  final int song;
  @override
  @JsonKey(name: 'is_first_Mission_Completed')
  final bool isFirstMissionCompleted;
  @override
  @JsonKey(name: 'is_user')
  final bool isUser;
  @override
  @JsonKey(name: 'last_order')
  final int lastOrder;

  @override
  String toString() {
    return 'Mission(module: $module, song: $song, isFirstMissionCompleted: $isFirstMissionCompleted, isUser: $isUser, lastOrder: $lastOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionImpl &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.song, song) || other.song == song) &&
            (identical(
                    other.isFirstMissionCompleted, isFirstMissionCompleted) ||
                other.isFirstMissionCompleted == isFirstMissionCompleted) &&
            (identical(other.isUser, isUser) || other.isUser == isUser) &&
            (identical(other.lastOrder, lastOrder) ||
                other.lastOrder == lastOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, module, song, isFirstMissionCompleted, isUser, lastOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionImplCopyWith<_$MissionImpl> get copyWith =>
      __$$MissionImplCopyWithImpl<_$MissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MissionImplToJson(
      this,
    );
  }
}

abstract class _Mission implements Mission {
  factory _Mission(
          {required final String module,
          required final int song,
          @JsonKey(name: 'is_first_Mission_Completed')
          required final bool isFirstMissionCompleted,
          @JsonKey(name: 'is_user') required final bool isUser,
          @JsonKey(name: 'last_order') required final int lastOrder}) =
      _$MissionImpl;

  factory _Mission.fromJson(Map<String, dynamic> json) = _$MissionImpl.fromJson;

  @override
  String get module;
  @override
  int get song;
  @override
  @JsonKey(name: 'is_first_Mission_Completed')
  bool get isFirstMissionCompleted;
  @override
  @JsonKey(name: 'is_user')
  bool get isUser;
  @override
  @JsonKey(name: 'last_order')
  int get lastOrder;
  @override
  @JsonKey(ignore: true)
  _$$MissionImplCopyWith<_$MissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
