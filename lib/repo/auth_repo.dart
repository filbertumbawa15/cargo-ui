import 'package:cargo_ui/core/api_client.dart';
import 'package:cargo_ui/core/session_manager.dart';
import 'package:cargo_ui/params/login_user_params.dart';
import 'package:cargo_ui/params/register_user_params.dart';
import 'package:cargo_ui/response/login_user_response.dart';
import 'package:cargo_ui/response/profile_user_response.dart';
import 'package:cargo_ui/response/register_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepo extends ApiClient {
  final sessionManager = SessionManager();
  Future<RegisterUserResponse> registerUser(RegisterUserParam param) async {
    try {
      final response = await dio.post('v1/register', data: param.toJson());
      debugPrint("POST Register: ${response.data}");
      return RegisterUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginUserResponse> loginUser(LoginUserParam param) async {
    try {
      print(param);
      final response = await dio.post('v1/login', data: param.toJson());
      debugPrint("POST Register: ${response.data}");
      return LoginUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProfileUserResponse> getProfile() async {
    try {
      Options _options = Options(headers: {
        'Authorization': 'Token ${sessionManager.getActiveToken()}'
      });
      print(sessionManager.getActiveId());
      final response = await dio.get(
        "v1/profile/${sessionManager.getActiveId()}",
        options: _options,
      );
      debugPrint("POST Register: ${response.data}");
      return ProfileUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
