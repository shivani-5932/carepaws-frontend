import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/activity_model.dart';

class ActivityChart extends StatelessWidget {
  final List<ActivityData> data;

  const ActivityChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: 180,
          child: PieChart(
            PieChartData(
              sections: data.map((e) {
                return PieChartSectionData(
                  value: e.value,
                  color: e.color,
                  radius: 70,
                  showTitle: false,
                );
              }).toList(),
            ),
          ),
        ),

        const SizedBox(height: 20),

        ...data.map((e) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 5, backgroundColor: e.color),
                const SizedBox(width: 8),
                Text(e.type),
              ],
            ),
            Text("${e.value.toInt()}%"),
          ],
        )),
      ],
    );
  }
}