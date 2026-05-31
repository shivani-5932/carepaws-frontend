import 'package:flutter/material.dart';

class EmptyNotificationWidget extends StatelessWidget {
  const EmptyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        const Text(
          "No Notifications Yet !",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff9A6A45),
          ),
        ),

        const SizedBox(height: 20),

        Image.asset(
          "assets/images/no_chat_dog.png",
          height: 250,
        )

      ],
    );
  }
}