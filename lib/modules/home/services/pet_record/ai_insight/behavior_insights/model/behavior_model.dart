import 'package:flutter/material.dart';

class BehaviorData {
  final String label;
  final double value;
  final Color color;

  BehaviorData({
    required this.label,
    required this.value,
    required this.color,
  });
}

class WeeklyActivity {
  final String day;
  final double minutes;

  WeeklyActivity({
    required this.day,
    required this.minutes,
  });
}