import 'reaction_model.dart';

class DmModel {
  final String profileImage;
  final String text;
  final bool isMe;
  final DateTime time;
  final ReactionModel? reaction;

  DmModel({
    required this.profileImage,
    required this.text,
    required this.isMe,
    required this.time,
    this.reaction,
  });

}