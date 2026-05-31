import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class SlotChipWidget extends StatelessWidget {

  final String time;
  final bool selected;
  final VoidCallback onTap;

  const SlotChipWidget({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        alignment: Alignment.center, // 🔥 key fix

        decoration: BoxDecoration(
          color: selected ? const Color(0xFF987052) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFFECF82)),
        ),

        child: Text(
          time,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}