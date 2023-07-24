class RegisterUserParam {
  String username;
  String email;
  bool isActive;
  bool isCustomer;
  String firstName;
  String lastName;
  String password1;
  String password2;

  RegisterUserParam(
    this.username,
    this.email,
    this.isActive,
    this.isCustomer,
    this.firstName,
    this.lastName,
    this.password1,
    this.password2,
  );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'is_active': isActive,
      'is_customer': isCustomer,
      'first_name': firstName,
      'last_name': lastName,
      'password1': password1,
      'password2': password2,
    };
  }
}
