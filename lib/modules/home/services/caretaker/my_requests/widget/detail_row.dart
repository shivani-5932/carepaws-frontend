import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label :  ",
            style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}