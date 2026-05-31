
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetProfileHeaderWidget extends StatelessWidget {
  const PetProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

           Text(
            "Tuffy.709",
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SvgPicture.asset(
            "assets/icons/more.svg",
            height: 32,
          )

        ],
      ),
    );
  }
}