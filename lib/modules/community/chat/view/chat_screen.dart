import 'package:care_paws/modules/community/chat/controller/chat_controller.dart';
import 'package:care_paws/modules/community/chat/widget/chat_header_widget.dart';
import 'package:care_paws/modules/community/chat/widget/chat_input_widget.dart';
import 'package:care_paws/modules/community/chat/widget/data_label_widget.dart';
import 'package:care_paws/modules/community/chat/widget/message_bubble_widget.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {

  ChatScreen({super.key});

  final ChatController controller = ChatController();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            const ChatHeaderWidget(),

            const DateLabelWidget(),

            /// CHAT LIST
            Expanded(
              child: ListView.builder(

                itemCount: controller.messages.length,

                itemBuilder: (context, index){

                  final msg = controller.messages[index];

                  return MessageBubbleWidget(
                    message: msg.message,
                    isMe: msg.isMe,
                  );
                },
              ),
            ),

            /// INPUT
            ChatInputWidget(
              controller: textController,
              onSend: (){
                print("send message");
              },
            )

          ],
        ),
      ),
    );
  }
}