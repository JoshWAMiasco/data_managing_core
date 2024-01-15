import 'package:data_managing_core/constants/base_reponse.dart';
import 'package:data_managing_core/models/record_model.dart';

class RecordResponse extends BaseResponse {
  RecordModel? record;
  RecordResponse({
    this.record,
  });
  RecordResponse.fromJson(Map<String, dynamic> json) {
    record = RecordModel.fromJson(json);
  }
}
