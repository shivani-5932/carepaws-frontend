class ShareUserModel {

  final String image;
  final String username;
  final bool verified;
  bool selected;

  ShareUserModel({
    required this.image,
    required this.username,
    this.verified = false,
    this.selected = false,
  });

}