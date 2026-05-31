import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {

  final String message;
  final bool isMe;

  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),

        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

        decoration: BoxDecoration(
          color: isMe
              ? const Color(0xffB38B59) // brown
              : const Color(0xffEFE6DD), // light
          borderRadius: BorderRadius.circular(12),
        ),

        child: Text(
          message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}