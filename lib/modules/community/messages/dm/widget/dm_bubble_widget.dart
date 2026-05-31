import 'package:care_paws/modules/community/messages/dm/model/dm_model.dart';
import 'package:flutter/material.dart';


class DmBubbleWidget extends StatelessWidget {

  final DmModel message;

  const DmBubbleWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
      message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,

      children: [

        if (message.reaction != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              "${message.reaction!.emoji} ${message.reaction!.label}",
              style: const TextStyle(fontSize: 12),
            ),
          ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

          decoration: BoxDecoration(
            color: message.isMe
                ? const Color(0xffF4A261)
                : Colors.grey.shade200,

            borderRadius: BorderRadius.circular(20),
          ),

          child: Text(message.text),
        ),
      ],
    );
  }
}