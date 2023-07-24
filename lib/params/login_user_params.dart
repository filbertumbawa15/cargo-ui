class LoginUserParam {
  String username;
  String password;

  LoginUserParam(
    this.username,
    this.password,
  );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
