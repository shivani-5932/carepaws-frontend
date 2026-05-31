import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/payment/payment_model.dart';
import 'package:care_paws/modules/profile/apc/model/profile_payment_model.dart';
import 'package:flutter/material.dart';

class ProfilePaymentCard extends StatelessWidget {
  final ProfilePaymentModel data;

  const ProfilePaymentCard({super.key, required this.data});

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

          /// MAIN TEXT
          RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: "${data.amount} ",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                 TextSpan(
                  text: "successfully paid to book consultation with ",
                  style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,

                ),
                 ),
                TextSpan(
                  text: "${data.doctorName} ",
                  style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.bold,

                  ),

                ),
                TextSpan(
                  text: "(${data.type})",
                  style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.bold,

                    color: Colors.grey
                ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          /// DATE TIME
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              data.dateTime,
    style: AppTextStyles.bodySmall.copyWith(
    fontWeight: FontWeight.bold,
      color: Colors.grey
    ),
            ),
          ),
        ],
      ),
    );
  }
}