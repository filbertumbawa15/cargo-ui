class UserLoginModel {
  String? token;
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;

  UserLoginModel({
    this.token,
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
  });
  UserLoginModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    id = json["id"];
    username = json["username"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
  }
}
