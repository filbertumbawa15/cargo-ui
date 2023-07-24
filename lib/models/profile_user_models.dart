class ProfileModel {
  String? name;
  String? email;
  String? username;
  String? avatar;

  ProfileModel({
    this.name,
    this.email,
    this.username,
    this.avatar,
  });
  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    username = json["username"];
    avatar = json["avatar"];
  }
}
