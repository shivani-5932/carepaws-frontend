import 'package:care_paws/modules/community/messages/dm/controller/dm_controller.dart';
import 'package:care_paws/modules/community/messages/dm/model/dm_model.dart';
import 'package:care_paws/modules/community/messages/dm/widget/dm_bubble_widget.dart';
import 'package:care_paws/modules/community/messages/dm/widget/typing_bar_widget.dart';
import 'package:flutter/material.dart';


class DmScreen extends StatelessWidget {

  DmScreen({super.key});
  final DmController controller = DmController();

  final List<DmModel> messages = [

    DmModel(
      profileImage:  "assets/images/cat1.png" ,
      text: "Hello 🐶",
      isMe: false,
      time: DateTime.now(),
    ),

    DmModel(
      profileImage: "assets/images/dog2.png",
      text: "Hey!",
      isMe: true,
      time: DateTime.now(),
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: messages.length,

              itemBuilder: (context,index){

                return DmBubbleWidget(
                  message: controller.messages[index],
                );

              },
            ),
          ),

          const TypingBarWidget(),

        ],
      ),
    );
  }
}