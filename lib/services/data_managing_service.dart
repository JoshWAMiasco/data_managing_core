import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_managing_core/models/create_record_response.dart';
import 'package:data_managing_core/models/delete_record_response.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:data_managing_core/models/all_records_response.dart';
import 'package:data_managing_core/models/record_response.dart';
import 'package:data_managing_core/models/update_record_response.dart';

class DataManagingService {
  Future<CreateRecordResponse> create(String userId, RecordModel newRecord) async {
    CreateRecordResponse response = CreateRecordResponse();
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').doc(newRecord.recordId).set(newRecord.toJson()).then((res) {
        response.success = true;
      });
      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<DeleteRecordResponse> delete(String userId, String recordId) async {
    DeleteRecordResponse response = DeleteRecordResponse();
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').doc(recordId).delete().then((res) {
        response.success = true;
      });
      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<AllRecordResponse> getAll(String userId) async {
    AllRecordResponse response = AllRecordResponse(records: []);
    try {
      return await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').get().then((snapshots) {
        if (snapshots.docs.isNotEmpty) {
          response = AllRecordResponse.fromJson(snapshots.docs);
        }
        response.success = true;
        return response;
      });
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<RecordResponse> get(String userId, String recordId) async {
    RecordResponse response = RecordResponse();
    try {
      return await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').doc(recordId).get().then((snapshots) {
        if (snapshots.data() != null) {
          response = RecordResponse.fromJson(snapshots.data()!);
          response.success = true;
        }
        return response;
      });
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<UpdateRecordResponse> update(String userId, RecordModel newRecord) async {
    UpdateRecordResponse response = UpdateRecordResponse();
    try {
      await FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').doc(newRecord.recordId).update(newRecord.toJson()).then((res) {
        response.success = true;
      });
      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Stream<List<RecordResponse>> listener(String userId) {
    return FirebaseFirestore.instance.collection('Users').doc(userId).collection('Records').snapshots().map((snapshots) {
      List<RecordResponse> recordsChange = [];
      for (var docChange in snapshots.docChanges) {
        RecordResponse res = RecordResponse.fromJson(docChange.doc.data() ?? {});
        res.changeType = docChange.type;
        recordsChange.add(res);
      }
      return recordsChange;
    });
  }
}
