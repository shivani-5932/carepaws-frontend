import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class ContinueButtonWidget extends StatelessWidget {

  final VoidCallback onTap;

  const ContinueButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: PrimaryButton(
        text: "Continue",
        onTap: () {
          // action
        },
      ),
    );
  }
}