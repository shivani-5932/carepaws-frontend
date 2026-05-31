import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/caretaker/widgets/caretaker_header_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/caretaker_option_card.dart';

class CaretakerScreen extends StatelessWidget {
  const CaretakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: const CustomHeader(title: "Caretaker"),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔹 Find Caretaker
               CaretakerOptionCard(
                title: "Find CareTaker",
                subtitle: "Find Caretaker by searching",
                image: "assets/images/caretaker1.png",
                onTap: () {
                  // navigate to search screen
                  Navigator.pushNamed(context, '/findCaretaker');
                },
              ),


            /// 🔹 Post Request
               CaretakerOptionCard(
                title: "Post a Request",
                subtitle:
                "Let the matching Caretaker find you according to your need",
                image: "assets/images/caretaker2.png",
                onTap: () {
                  // navigate to post request screen
                  Navigator.pushNamed(context, '/postRequest');
                },
              ),


            const Spacer(),

            /// 🔹 My Requests Button
            PrimaryButton(
              text: "My Requests",
              onTap: () {
                // navigate to my requests
                Navigator.pushNamed(context, '/myRequests');
              },
            ),
          ],
        ),
      ),
    );
  }
}