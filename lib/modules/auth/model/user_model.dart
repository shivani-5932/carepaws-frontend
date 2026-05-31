class UserModel {
  String name;
  String phone;
  String? email;
  bool isVet;

  UserModel({
    required this.name,
    required this.phone,
    this.email,
    this.isVet = false,
  });
}