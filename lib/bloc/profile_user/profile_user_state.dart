part of 'profile_user_bloc.dart';

@immutable
abstract class ProfileUserState {}

class ProfileUserInitial extends ProfileUserState {}

class ProfileUserLoading extends ProfileUserState {}

class ProfileUserLoaded extends ProfileUserState {
  final ProfileUserResponse profileUserResponse;
  ProfileUserLoaded({required this.profileUserResponse});
}

class ProfileUserError extends ProfileUserState {
  final String? message;
  ProfileUserError({required this.message});
}
