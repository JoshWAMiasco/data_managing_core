// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordModelImpl _$$RecordModelImplFromJson(Map<String, dynamic> json) =>
    _$RecordModelImpl(
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      recordId: json['recordId'] as String?,
      remarks: json['remarks'] as String?,
      subject: json['subject'] as String?,
    );

Map<String, dynamic> _$$RecordModelImplToJson(_$RecordModelImpl instance) =>
    <String, dynamic>{
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'recordId': instance.recordId,
      'remarks': instance.remarks,
      'subject': instance.subject,
    };
