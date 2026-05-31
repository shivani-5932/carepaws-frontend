import 'package:care_paws/modules/community/messages/dm/model/dm_model.dart';


import '../model/reaction_model.dart';

class DmController {

  /// Messages list
  List<DmModel> messages = [

    DmModel(
      profileImage: "assets/images/cat1.png",
      text: "Hello 🐶",
      isMe: false,
      time: DateTime.now(),
    ),

    DmModel(
      profileImage: "assets/images/dog1.png",
      text: "Hey!",
      isMe: true,
      time: DateTime.now(),
    ),

  ];

  /// Send message
  void sendMessage(String text) {

    messages.add(

      DmModel(
        profileImage: "assets/images/dog1.png",
        text: text,
        isMe: true,
        time: DateTime.now(),
      ),

    );
  }

  /// Add reaction
  void addReaction(int index, ReactionModel reaction) {

    messages[index] = DmModel(
      profileImage: messages[index].profileImage,
      text: messages[index].text,
      isMe: messages[index].isMe,
      time: messages[index].time,
      reaction: reaction,
    );

  }

}