class ClipModel {
  final String videoUrl;
  final String profileImage;
  final String username;
  final bool verified;
  final String caption;
  final String audio;
  final String likes;
  final String comments;
  final String shares;

  ClipModel({
    required this.videoUrl,
    required this.profileImage,
    required this.username,
    this.verified = false,
    required this.caption,
    required this.audio,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}