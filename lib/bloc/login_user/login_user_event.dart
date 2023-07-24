part of 'login_user_bloc.dart';

@immutable
abstract class LoginUserEvent {}

class LoggedInUserEvent extends LoginUserEvent {
  String username;
  String password;

  LoggedInUserEvent({
    required this.username,
    required this.password,
  });
}
