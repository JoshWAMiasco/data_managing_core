import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';
part 'record_model.g.dart';

@freezed
class RecordModel with _$RecordModel {
  const factory RecordModel({
    DateTime? dateCreated,
    String? recordId,
    String? remarks,
    String? subject,
  }) = _RecordModel;

  factory RecordModel.fromJson(Map<String, dynamic> json) => _$RecordModelFromJson(json);
}
