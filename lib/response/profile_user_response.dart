import 'package:cargo_ui/models/profile_user_models.dart';

class ProfileUserResponse {
  final ProfileModel? profileModel;
  final String? message;

  ProfileUserResponse({required this.profileModel, this.message});

  factory ProfileUserResponse.fromJson(Map<String, dynamic> json) {
    return ProfileUserResponse(
      profileModel: ProfileModel.fromJson(json),
    );
  }
}
