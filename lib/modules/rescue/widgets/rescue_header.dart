import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RescueHeader extends StatelessWidget {
  const RescueHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Title
          //  Text(
          //   "Nearby Rescue",
          //   style: AppTextStyles.h2.copyWith(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w700,
          //   ),
          // ),

          /// 🐾 LOGO + NAME
          Row(
            children: [
              Image.asset(
                "assets/icons/logo_circle.png",
                height: 36,
                width: 36,
              ),

              const SizedBox(width: 6),

              Text(
                "CarePaws",
                style: AppTextStyles.h1.copyWith(
                  fontSize: 28, // keep exact as you want
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4A3426),
                ),
              ),
            ],
          ),

          /// Icons (Filter + Bell)
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/cat.svg",
              height: 32,
              width: 32,
              ),
              const SizedBox(width: 14),
              SvgPicture.asset(
                  "assets/icons/filter1.svg",
                height: 32,
                width: 32,
              ),
              const SizedBox(width: 14),
              Image.asset(
                  "assets/icons/notification.png",
                height: 32,
                width: 32,
              ),
            ],
          )
        ],
      ),
    );
  }
}