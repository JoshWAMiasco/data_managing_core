import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_managing_core/models/info_model.dart';
import 'package:data_managing_core/models/logout_response.dart';
import 'package:data_managing_core/models/register_request.dart';
import 'package:data_managing_core/models/register_response.dart';
import 'package:data_managing_core/models/user_response.dart';
import 'package:data_managing_core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  Future<UserResponse> login(String username, String pin) async {
    UserResponse response = UserResponse(user: UserModel.fromJson({}));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: pin).then((credential) async {
        if (credential.user != null) {
          final res = await getUser(credential.user!.uid);
          if (res.success) {
            response = UserResponse(user: res.user);
            response.success = true;
          } else {
            response.message = 'User data is null';
          }
        } else {
          response.message = 'User not exist';
        }
        return response;
      });
      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<LogoutResponse> logout() async {
    LogoutResponse response = LogoutResponse();
    try {
      await FirebaseAuth.instance.signOut();
      response.success = true;
      return response;
    } on FirebaseAuthException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<UserResponse> getUser(String id) async {
    UserResponse response = UserResponse(user: UserModel.fromJson({}));
    try {
      final userDoc = await FirebaseFirestore.instance.collection('Users').doc(id).get();
      if (userDoc.data() != null) {
        UserModel user = UserModel.fromJson(userDoc.data()!);
        response = UserResponse(user: user);
        response.success = true;
      } else {
        response.message = 'User data is null';
      }
      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    RegisterResponse response = RegisterResponse(uid: '');
    try {
      final email = '${request.username}@data.com';
      final password = '${request.pin}@data';
      final existingUser = await FirebaseFirestore.instance.collection('Users').doc(email).get();
      if (existingUser.exists) {
        response.message = 'Username already been used';
        return response;
      }
      final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (newUser.user != null) {
        response.uid = newUser.user!.uid;
        response.success = true;
      } else {
        response.message = 'User not created';
      }

      UserModel newUserData = UserModel(id: newUser.user!.uid, username: email, pin: password);

      await FirebaseFirestore.instance.collection('Users').doc(newUser.user!.uid).set(newUserData.toJson());

      return response;
    } on FirebaseAuthException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  Future<UserResponse> loginAsGuest() async {
    UserResponse response = UserResponse(
      user: const UserModel(
        id: '',
        username: '',
        pin: '',
      ),
    );
    try {
      final infoRes = await FirebaseFirestore.instance.collection('Public').doc('Info').get();
      if (infoRes.data() == null) {
        response.message = 'Internal Data is null';
        return response;
      }

      InfoModel info = InfoModel.fromJson(infoRes.data()!);

      final email = "guest${info.numberOfGuest}";
      final pin = "guest-${info.numberOfGuest}";

      final registerRes = await register(RegisterRequest(username: email, pin: pin));
      if (registerRes.success == false) {
        response.message = 'Can\'t Create guest account';
        return response;
      }

      final userRes = await getUser(registerRes.uid);
      if (userRes.success == false) {
        response.message = 'Guest data is null';
        return response;
      }

      await FirebaseFirestore.instance.collection('Public').doc('Info').update({
        "numberOfGuest": FieldValue.increment(1),
      });

      response.user = userRes.user;
      response.success = true;

      return response;
    } on FirebaseException catch (e) {
      response.message = e.message ?? '';
      return response;
    }
  }

  bool hasAlreadyLogin() => FirebaseAuth.instance.currentUser != null;
  String getUserId() => FirebaseAuth.instance.currentUser!.uid;
}
