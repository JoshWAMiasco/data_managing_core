library data_managing_core;

import 'package:firebase_core/firebase_core.dart';

class DataManagingCore {
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}
