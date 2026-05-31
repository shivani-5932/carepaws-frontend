class MessageModel {
  final String profileImage;
  final String username;
  final String lastMessage;
  final String time;
  final bool unread;

  MessageModel({
    required this.profileImage,
    required this.username,
    required this.lastMessage,
    required this.time,
    this.unread = false,
  });
}