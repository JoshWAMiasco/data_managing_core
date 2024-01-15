import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseResponse {
  bool success;
  String message;
  DocumentChangeType? changeType;
  BaseResponse({
    this.message = '',
    this.success = false,
    this.changeType,
  });
}
