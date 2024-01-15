import 'package:data_managing_core/constants/base_reponse.dart';
import 'package:data_managing_core/models/record_model.dart';

class AllRecordResponse extends BaseResponse {
  List<RecordModel>? records;
  AllRecordResponse({
    this.records,
  });
  AllRecordResponse.fromJson(List<dynamic> json) {
    List<RecordModel> list = [];
    for (var data in json) {
      list.add(RecordModel.fromJson(data.data()));
    }
    records = list;
  }
}
