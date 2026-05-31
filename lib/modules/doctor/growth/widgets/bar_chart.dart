import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWidget extends StatelessWidget {
  final List<int> data;

  const BarChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0D5C8)),
      ),

      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),

          barGroups: List.generate(
            data.length,
                (i) => BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: data[i].toDouble(),
                  width: 14,
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(
                    colors: [
                      Colors.brown.shade200,
                      Colors.brown.shade700,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}