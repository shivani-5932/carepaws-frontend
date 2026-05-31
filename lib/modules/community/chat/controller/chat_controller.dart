import 'package:care_paws/modules/community/chat/model/chat_model.dart';



class ChatController {

  List<ChatModel> messages = [

    ChatModel(message: "hello how are you ?", isMe: true, time: "8:30 pm"),
    ChatModel(message: "hi i am good what about you ?", isMe: false, time: ""),
    ChatModel(message: "good", isMe: true, time: ""),

    ChatModel(message: "sounds fun, I can't wait to join them!", isMe: false, time: ""),

    ChatModel(message: "yes i am going there", isMe: true, time: ""),

    ChatModel(message: "i was thinking tuffy to carry along myself", isMe: true, time: ""),

    ChatModel(message: "nice i will also go with parry and his friends.", isMe: false, time: ""),

  ];

}