import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/profile/apc/model/profile_consultation_model.dart';
import 'package:flutter/material.dart';

class ProfileConsultationCard extends StatelessWidget {
  final ProfileConsultationModel data;

  const ProfileConsultationCard({super.key, required this.data});

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

          /// TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.clientName,
                style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                data.dateTime,
                style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Text(
            "Pet’s Name : ${data.petName}",
            style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.black),
          ),

          const SizedBox(height: 6),

          /// BOTTOM ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.type,
                style: AppTextStyles.bodySmall.copyWith(fontSize: 12, color: Colors.black),
              ),
              Text(
                data.price,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}