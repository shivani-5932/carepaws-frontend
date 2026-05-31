class SearchUserModel {

  final String image;
  final String username;
  final String subtitle;
  final bool verified;

  SearchUserModel({
    required this.image,
    required this.username,
    required this.subtitle,
    this.verified = false,
  });

}