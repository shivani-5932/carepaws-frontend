class NotificationModel {

  final String image;
  final String username;
  final String action;
  final String time;
  final String? postImage;
  final bool isVerified;
  final bool showFollow;
  final bool isFollowing;

  NotificationModel({
    required this.image,
    required this.username,
    required this.action,
    required this.time,
    this.postImage,
    this.isVerified = false,
    this.showFollow = false,
    this.isFollowing = false,
  });

}