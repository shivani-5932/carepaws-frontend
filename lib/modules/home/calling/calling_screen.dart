import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/home/calling/widget/call_controls_widget.dart';
import 'package:care_paws/modules/home/calling/widget/call_status_widget.dart';
import 'package:flutter/material.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffEDE6DF), // beige

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 40),

            /// NAME + STATUS
            const CallStatusWidget(
              name: "Dr. Karun Singh",
              status: "Ringing",
            ),

            const SizedBox(height: 30),

            /// AVATAR
            const ProfileAvatarWidget(
              image: "assets/images/doc1.png",
              size: 110,
              hasStory: false,
            ),

            const Spacer(),

            /// CONTROLS
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CallControlsWidget(
                onEnd: (){
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}