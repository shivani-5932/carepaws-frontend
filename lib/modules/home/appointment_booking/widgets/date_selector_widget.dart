import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_controller.dart';
import 'package:flutter/material.dart';

class DateSelectorWidget extends StatelessWidget {
  final BookingController controller;
  final Function(int) onSelect;

  const DateSelectorWidget({
    super.key,
    required this.controller,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final dates = [
      {"day": "FRI", "date": "20"},
      {"day": "SAT", "date": "21"},
      {"day": "SUN", "date": "22"},
      {"day": "MON", "date": "23"},
      {"day": "TUE", "date": "24"},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (_, i) {
          final selected = controller.model.selectedDateIndex == i;
          final isLeave = controller.model.isLeave[i];

          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              width: 60, // ✅ FIXED WIDTH (same for all)
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),

              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFF987052)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFECF82)),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// 🔥 LEAVE
                  if (isLeave)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: ["L", "E", "A", "V", "E"].map((e) {
                        return Text(
                          e,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: Colors.red,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }).toList(),
                    )

                  /// 🔥 NORMAL
                  else ...[
                    Text(
                      dates[i]["day"]!,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: selected ? Colors.white : Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      dates[i]["date"]!,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: selected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}