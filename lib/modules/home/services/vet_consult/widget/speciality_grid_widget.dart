import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class SpecialityGridWidget extends StatelessWidget {

  final List data;

  const SpecialityGridWidget({super.key, required this.data});

  int getCrossAxisCount(double width) {
    if (width < 600) return 3;
    if (width < 900) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final crossAxisCount = getCrossAxisCount(constraints.maxWidth);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: data.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1, // 🔥 less height gap
          ),

          itemBuilder: (context, index) {

            return Column(
              children: [

                Container(
                  height: 60,
                  width: 60,
                  // padding: const EdgeInsets.all(4), // 👈 reduced for better fill

                  decoration: BoxDecoration(
                    color: const Color(0xffF7F2EE),
                    border: Border.all(
                      color: const Color(0xffD6C6BA),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      data[index]["img"],
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover, // 🔥 FIX: full cover
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  data[index]["title"],
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff6F5B4B),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}