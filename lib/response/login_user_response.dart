import 'package:cargo_ui/models/login_user_models.dart';

class LoginUserResponse {
  final UserLoginModel? userLoginModel;
  final String message;

  LoginUserResponse({required this.userLoginModel, required this.message});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return LoginUserResponse(
      userLoginModel: UserLoginModel.fromJson(json["data"]),
      message: "Berhasil menambahkan Data User",
    );
  }
}
