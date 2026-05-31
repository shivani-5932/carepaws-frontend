class CommentModel {

  final String image;
  final String username;
  final String comment;
  final bool verified;
  final String likes;
  final bool isMine;

  CommentModel({
    required this.image,
    required this.username,
    required this.comment,
    this.verified = false,
    required this.likes,
    this.isMine = false,
  });

}