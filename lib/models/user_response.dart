import 'package:data_managing_core/constants/base_reponse.dart';
import 'package:data_managing_core/models/user_model.dart';

class UserResponse extends BaseResponse {
  UserModel user;
  UserResponse({required this.user});
}
