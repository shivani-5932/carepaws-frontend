import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/features/services/service_type.dart';
import 'package:flutter/material.dart';

class CommonCardWidget extends StatelessWidget {

  final String image;
  final String title;
  final ServiceType? type;   // optional

  final double height;
  final bool showBorder;
  final bool isSelected;

  const CommonCardWidget({
    super.key,
    required this.image,
    required this.title,
    this.height = 240,
    this.showBorder = false,
    this.isSelected = false,
    this.type,    // optional
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 163,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        border: showBorder
            ? Border.all(
          color: isSelected ? Colors.brown : Colors.transparent,
        )
            : null,
      ),

      child: Padding(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [

            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),

                child: Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  width: 147,
                  height: 155,

                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center, // ✅ IMPORTANT
                    width: double.infinity,
                    height: double.infinity,

                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Icon(Icons.error));
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 4),

            Text(
                   title,
                   textAlign: TextAlign.center,
                   maxLines: 2, // 👈 important
                   overflow: TextOverflow.ellipsis, // 👈 overflow fix
                   style: AppTextStyles.h3.copyWith(
                   fontWeight: FontWeight.w700,
                   fontSize: 16,
                   color: const Color(0xff4A3426),
                   height: 1.2, // 👈 better line spacing
                 ),
               ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}