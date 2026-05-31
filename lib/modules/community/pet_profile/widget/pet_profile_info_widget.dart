import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class PetProfileInfoWidget extends StatelessWidget {
  const PetProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),

      child: Column(
        children: [

          const SizedBox(height: 50),

          /// STATS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              buildStat("1080", "Posts"),
              buildStat("1080", "Followers"),
              buildStat("1080", "Following"),

            ],
          ),

          const SizedBox(height: 10),

          /// NAME
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tuffy The Cute",
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black
              ),
            ),
          ),

          const SizedBox(height: 4),

          /// BIO
           Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tiny paws, big heart, endless energy.",
              style: AppTextStyles.bodySmall.copyWith(fontSize: 13),
            ),
          ),

          const SizedBox(height: 4),

          /// LINKS
          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [

                  TextSpan(
                    text: "Snapchat : ",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  TextSpan(
                    text: "petty.tuffy",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xffFF9800), // 🔥 orange
                      fontSize: 12,
                    ),
                  ),

                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [

                  TextSpan(
                    text: "YouTube Channel : ",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),

                  TextSpan(
                    text: "www.youtube.com/pet.tuffy",
                    style: AppTextStyles.bodySmall.copyWith(
                      color: const Color(0xffFF9800), // 🔥 orange
                      fontSize: 12,
                    ),
                  ),

                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

        ],
      ),
    );
  }

  Widget buildStat(String number, String label) {

    return Column(
      children: [

        Text(
          number,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: Color(0xffFF9800),
          ),
        ),

        Text(label,
        style: AppTextStyles.bodySmall,),

      ],
    );
  }
}