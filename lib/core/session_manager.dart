import 'package:hive/hive.dart';

class SessionManager {
  final Box box = Hive.box('session');

  void setSession(
      int id, String token, String email, String firstName, String lastName) {
    box.put(AppKey.idKey, id);
    box.put(AppKey.tokenKey, token);
    box.put(AppKey.emailKey, email);
    box.put(AppKey.firstNameKey, firstName);
    box.put(AppKey.lastNameKey, lastName);
  }

  int? getActiveId() => box.get(AppKey.idKey);
  String? getActiveToken() => box.get(AppKey.tokenKey);
  String? getActiveEmail() => box.get(AppKey.emailKey);
  String? getActiveFirstName() => box.get(AppKey.firstNameKey);
  String? getActiveLastName() => box.get(AppKey.lastNameKey);

  bool anyActiveSession() {
    int? activeId = getActiveId();
    String? activeToken = getActiveToken();
    String? activeEmail = getActiveEmail();
    String? activeFirstName = getActiveFirstName();
    String? activeLastName = getActiveLastName();
    return activeId != null &&
        activeToken != null &&
        activeEmail != null &&
        activeFirstName != null &&
        activeLastName != null;
  }

  void signout() {
    box.delete(AppKey.idKey);
    box.delete(AppKey.tokenKey);
    box.delete(AppKey.emailKey);
    box.delete(AppKey.firstNameKey);
    box.delete(AppKey.lastNameKey);
  }
}

class AppKey {
  static const String idKey = 'ID_KEY';
  static const String tokenKey = 'TOKEN_KEY';
  static const String emailKey = 'EMAIL_KEY';
  static const String firstNameKey = 'FIRSTNAME_KEY';
  static const String lastNameKey = 'LASTNAME_KEY';
}
