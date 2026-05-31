import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInputWidget extends StatefulWidget {

  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputWidget({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  State<ChatInputWidget> createState() => _ChatInputWidgetState();
}

class _ChatInputWidgetState extends State<ChatInputWidget> {

  bool isTyping = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {

      final typingNow =
          widget.controller.text.trim().isNotEmpty;

      if (typingNow != isTyping) {

        setState(() {
          isTyping = typingNow;
        });

      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8),

      decoration: const BoxDecoration(
        color: Colors.white,
      ),

      child: Row(
        children: [

          /// EMOJI
          _iconBox("assets/icons/emoji.svg"),

          const SizedBox(width: 8),

          /// TEXT FIELD
          Expanded(
            child: TextField(
              controller: widget.controller,

              decoration: const InputDecoration(
                hintText: "Write a Message...",
                border: InputBorder.none,
              ),
            ),
          ),

          /// RIGHT SIDE
          isTyping
              ? _sendButton()
              : Row(
            children: [

              _iconBox(
                  "assets/icons/mic.svg"),

              const SizedBox(width: 10),

              _iconBox(
                  "assets/icons/gallery.svg"),

              const SizedBox(width: 10),

              _iconBox(
                  "assets/icons/camera.svg"),

            ],
          ),

        ],
      ),
    );
  }

  /// Reusable Icon Box
  Widget _iconBox(String asset) {

    return Container(
      height: 32,
      width: 32,

      decoration: BoxDecoration(
        color: const Color(0xff6B4F3A),
        borderRadius:
        BorderRadius.circular(5),
      ),

      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SvgPicture.asset(
          asset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// Send Button
  Widget _sendButton() {

    return GestureDetector(
      onTap: () {
        widget.onSend();
        widget.controller.clear();
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: const Color(0xff6B4F3A),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: SvgPicture.asset(
            "assets/icons/send.svg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}