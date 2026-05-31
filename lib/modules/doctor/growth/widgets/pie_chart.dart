import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final List<int> data;

  const PieChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final total = data.reduce((a, b) => a + b);

    return Container(
      height: 300, // 👈 size bada
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0D5C8)),
      ),

      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 20, // 👈 thoda center gap for premium look

          sections: [
            PieChartSectionData(
              value: data[0].toDouble(),
              color: Colors.blue,
              title: "Call",
              radius: 90, // 👈 BIG slices
            ),
            PieChartSectionData(
              value: data[1].toDouble(),
              color: Colors.redAccent,
              title: "Chat",
              radius: 90,
            ),
            PieChartSectionData(
              value: data[2].toDouble(),
              color: Colors.deepPurple,
              title: "Video",
              radius: 90,
            ),
          ],
        ),
      ),
    );
  }
}