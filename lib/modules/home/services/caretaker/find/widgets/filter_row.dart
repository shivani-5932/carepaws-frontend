import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Filter Button
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/filter');
          },
          child: Container(
            height: 36,
            width: 91,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF6E4B2A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Filter",
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        /// Location
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/location.png",
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  "Sharifpura, Asr",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmall,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ],
    );
  }
}