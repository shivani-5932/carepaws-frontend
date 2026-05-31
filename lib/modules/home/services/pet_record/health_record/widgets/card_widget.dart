import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';

class CommonRecordCard extends StatelessWidget {

  final String petName;
  final List<Map<String, dynamic>> records;

  const CommonRecordCard({
    super.key,
    required this.petName,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🐶 PET NAME
          Text(
            "$petName's Vaccination Records",

            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          /// Divider
          Container(
            height: 1,
            color: Colors.grey.shade300,
          ),

          const SizedBox(height: 12),

          /// Vaccine List
          Column(
            children: records.map((record) {

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),

                child: Row(
                  children: [

                    /// Icon
                    SvgPicture.asset(
                      record["icon"],
                      height: 18,
                      width: 18,
                    ),

                    const SizedBox(width: 10),

                    /// Vaccine Name
                    Expanded(
                      child: Text(
                        record["name"],

                        style: AppTextStyles.bodySmall,
                      ),
                    ),

                    /// Date
                    Text(
                      record["date"],

                      style: AppTextStyles.bodySmall.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),

                  ],

                ),

              );

            }).toList(),

          ),

        ],
      ),
    );
  }
}