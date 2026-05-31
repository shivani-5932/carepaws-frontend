import 'package:flutter/material.dart';
import '../model/behavior_model.dart';

class ActivityBarChart extends StatelessWidget {
  final List<WeeklyActivity> data;

  const ActivityBarChart({
    super.key,
    required this.data,
  });

  /// 🎨 Dynamic 3-tone brown color
  Color getBarColor(double value, double max) {
    double t = value / max;

    if (t < 0.5) {
      return Color.lerp(
        const Color(0xFFC2A27A), // Light brown
        const Color(0xFF987052), // Medium brown
        t * 2,
      )!;
    } else {
      return Color.lerp(
        const Color(0xFF987052), // Medium brown
        const Color(0xFF4D453B), // Dark brown
        (t - 0.5) * 2,
      )!;
    }
  }

  @override
  Widget build(BuildContext context) {

    final max = data
        .map((e) => e.minutes)
        .reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 360, // 🔥 Chart total height

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,

        children: data.map((e) {

          final height =
              (e.minutes / max) * 260; // 🔥 scaled inside 360

          final barColor =
          getBarColor(e.minutes, max);

          return Column(
            mainAxisAlignment:
            MainAxisAlignment.end,

            children: [

              /// Minutes
              Text(
                "${e.minutes.toInt()}m",
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 6),

              /// Bar
              Container(
                height: height,
                width: 20,

                decoration: BoxDecoration(
                  color: barColor,

                  /// 🔥 Very Light Rounded
                  borderRadius:
                  BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 8),

              /// Day
              Text(
                e.day,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),

            ],
          );

        }).toList(),
      ),
    );
  }
}