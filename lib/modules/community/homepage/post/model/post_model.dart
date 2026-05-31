class PostModel {
  final String profileImage;
  final String username;
  final bool isVerified;
  final String postImage;
  final String likes;
  final String comments;
  final String shares;
  final String caption;
  final String timeAgo;

  PostModel({
    required this.profileImage,
    required this.username,
    this.isVerified = false,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.timeAgo,
  });
}