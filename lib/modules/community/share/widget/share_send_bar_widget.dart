import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class ShareSendBarWidget extends StatelessWidget {

  final bool show;

  const ShareSendBarWidget({
    super.key,
    required this.show,
  });

  @override
  Widget build(BuildContext context) {

    if (!show) return const SizedBox();

    return Column(
      children: [

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Write a Message...",
              border: InputBorder.none,
            ),
          ),
        ),

        PrimaryButton(
          text: "Send",
          onTap: () {
            // action


            /// 🔥 Close Bottom Sheet
            Navigator.pop(context);

            /// 🔥 Show Sent Snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sent!"),
                duration: Duration(seconds: 2),
              ),
            );
          },
        )

      ],
    );
  }
}