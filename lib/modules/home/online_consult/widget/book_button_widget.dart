import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class BookButtonWidget extends StatelessWidget {

  final bool isAvailable;
  final String consultTime;

  const BookButtonWidget({
    super.key,
    required this.isAvailable,
    required this.consultTime,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        PrimaryButton(
          text: "Book Consult",
          onTap: isAvailable? () {
            // action
            Navigator.pushNamed(context, '/addPet');
          }: null,
        ),

        if(!isAvailable && consultTime.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              consultTime,
              style:  AppTextStyles.bodySmall.copyWith(
                  color: Colors.orange
              ),
            ),
          )
      ],
    );
  }
}