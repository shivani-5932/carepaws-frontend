import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class UrgencyButtonWidget extends StatelessWidget {
  const UrgencyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return PrimaryButton(
      text: "Urgency Vet Consult  →",
      onTap: () {
        // action
      },
    );
  }
}