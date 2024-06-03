class UserModel {
  final String? id;
  final String name;
  final String lastName;
  final String mail;
  final String password;

  UserModel(
      {this.id,
      required this.name,
      required this.lastName,
      required this.mail,
      required this.password});

  toJson() {
    return {
      "lastname": lastName,
      "mail": mail,
      "name": name,
      "password": password
    };
  }
}
