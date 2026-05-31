import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EarningsChart extends StatelessWidget {
  final List<int> data;

  const EarningsChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxY = data.reduce((a, b) => a > b ? a : b).toDouble();
    int maxIndex = data.indexOf(data.reduce((a, b) => a > b ? a : b));

    return Container(
      height: 230,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0D5C8)),
      ),

      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: maxY + 500,

          /// ✅ GRID CLEAN
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
          ),

          /// ✅ REMOVE RIGHT SIDE VALUES (FIX YOUR ISSUE)
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // ❌ removed
            ),

            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),

            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1000,
                getTitlesWidget: (value, _) {
                  return Text(
                    "${(value ~/ 1000)}K",
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),

            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
          ),

          borderData: FlBorderData(show: false),

          /// 🔥 TOUCH TOOLTIP (THIS IS WHAT YOU WANTED)
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => const Color(0xff7B5B44),

              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    "Rs ${spot.y.toInt()}",
                    const TextStyle(color: Colors.white),
                  );
                }).toList();
              },
            ),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                data.length,
                    (i) => FlSpot(i.toDouble(), data[i].toDouble()),
              ),

              isCurved: true,
              color: Colors.green,
              barWidth: 3,

              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.2),
              ),

              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}