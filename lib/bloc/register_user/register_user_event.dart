part of 'register_user_bloc.dart';

@immutable
abstract class RegisterUserEvent {}

class CreateUserEvent extends RegisterUserEvent {
  String username;
  String email;
  bool isActive;
  bool isCustomer;
  String firstName;
  String lastName;
  String password1;
  String password2;

  CreateUserEvent(
      {required this.username,
      required this.email,
      required this.isActive,
      required this.isCustomer,
      required this.firstName,
      required this.lastName,
      required this.password1,
      required this.password2});
}
