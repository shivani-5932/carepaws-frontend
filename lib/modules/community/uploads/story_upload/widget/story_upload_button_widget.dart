import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:flutter/material.dart';

class StoryUploadButtonWidget extends StatelessWidget {
  const StoryUploadButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ContrastButton(
      text: "Upload Pet Story",
      height: 52,
      onTap: () {},
    );
  }
}