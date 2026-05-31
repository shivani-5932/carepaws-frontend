import 'package:flutter/material.dart';

class SuccessTextWidget extends StatelessWidget {
  const SuccessTextWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: const [

        Text(
          "Your Visit Scheduled successfully",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: 8),

        Text(
          "you have successfully booked an appointment, Vet will connect you at your scheduled slot",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}