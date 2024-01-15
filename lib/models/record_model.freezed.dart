// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return _RecordModel.fromJson(json);
}

/// @nodoc
mixin _$RecordModel {
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  String? get recordId => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordModelCopyWith<RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordModelCopyWith<$Res> {
  factory $RecordModelCopyWith(
          RecordModel value, $Res Function(RecordModel) then) =
      _$RecordModelCopyWithImpl<$Res, RecordModel>;
  @useResult
  $Res call(
      {DateTime? dateCreated,
      String? recordId,
      String? remarks,
      String? subject});
}

/// @nodoc
class _$RecordModelCopyWithImpl<$Res, $Val extends RecordModel>
    implements $RecordModelCopyWith<$Res> {
  _$RecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateCreated = freezed,
    Object? recordId = freezed,
    Object? remarks = freezed,
    Object? subject = freezed,
  }) {
    return _then(_value.copyWith(
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordId: freezed == recordId
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordModelImplCopyWith<$Res>
    implements $RecordModelCopyWith<$Res> {
  factory _$$RecordModelImplCopyWith(
          _$RecordModelImpl value, $Res Function(_$RecordModelImpl) then) =
      __$$RecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dateCreated,
      String? recordId,
      String? remarks,
      String? subject});
}

/// @nodoc
class __$$RecordModelImplCopyWithImpl<$Res>
    extends _$RecordModelCopyWithImpl<$Res, _$RecordModelImpl>
    implements _$$RecordModelImplCopyWith<$Res> {
  __$$RecordModelImplCopyWithImpl(
      _$RecordModelImpl _value, $Res Function(_$RecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateCreated = freezed,
    Object? recordId = freezed,
    Object? remarks = freezed,
    Object? subject = freezed,
  }) {
    return _then(_$RecordModelImpl(
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recordId: freezed == recordId
          ? _value.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordModelImpl implements _RecordModel {
  const _$RecordModelImpl(
      {this.dateCreated, this.recordId, this.remarks, this.subject});

  factory _$RecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordModelImplFromJson(json);

  @override
  final DateTime? dateCreated;
  @override
  final String? recordId;
  @override
  final String? remarks;
  @override
  final String? subject;

  @override
  String toString() {
    return 'RecordModel(dateCreated: $dateCreated, recordId: $recordId, remarks: $remarks, subject: $subject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordModelImpl &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateCreated, recordId, remarks, subject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      __$$RecordModelImplCopyWithImpl<_$RecordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordModelImplToJson(
      this,
    );
  }
}

abstract class _RecordModel implements RecordModel {
  const factory _RecordModel(
      {final DateTime? dateCreated,
      final String? recordId,
      final String? remarks,
      final String? subject}) = _$RecordModelImpl;

  factory _RecordModel.fromJson(Map<String, dynamic> json) =
      _$RecordModelImpl.fromJson;

  @override
  DateTime? get dateCreated;
  @override
  String? get recordId;
  @override
  String? get remarks;
  @override
  String? get subject;
  @override
  @JsonKey(ignore: true)
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
