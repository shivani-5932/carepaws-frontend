import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class DateLabelWidget extends StatelessWidget {
  const DateLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [

        SizedBox(height: 10),

        Text("Today", style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold, color: Colors.black)),

        Text("8:30 pm", style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.black)),

        SizedBox(height: 10),

      ],
    );
  }
}