import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/profile/apc/model/profile_rescue_model.dart';
import 'package:flutter/material.dart';

class ProfileRescueCard extends StatelessWidget {
  final ProfileRescueModel data;

  const ProfileRescueCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// LOCATION
          Text(
            "Location : ${data.location}",
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 4),

          /// PROBLEM
          Text(
            "Problem : ${data.problem}",
            style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.black),
          ),

          const SizedBox(height: 6),

          /// DATE
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              data.dateTime,
              style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}