import 'package:flutter/material.dart';
import '../model/behavior_model.dart';

List<BehaviorData> behaviorData = [
  BehaviorData(label: "Calm", value: 20, color: Color(0xFF36A9CE)),
  BehaviorData(label: "Happy & Energetic", value: 60, color: Color(0xFFA3E048)),
  BehaviorData(label: "Low", value: 15, color: Color(0xFFF9A825)),
  BehaviorData(label: "Aggressive", value: 5, color: Color(0xFFE53935)),
];

List<WeeklyActivity> weeklyData = [
  WeeklyActivity(day: "Mon", minutes: 25),
  WeeklyActivity(day: "Tue", minutes: 30),
  WeeklyActivity(day: "Wed", minutes: 40),
  WeeklyActivity(day: "Thurs", minutes: 20),
  WeeklyActivity(day: "Fri", minutes: 45),
  WeeklyActivity(day: "Sat", minutes: 25),
  WeeklyActivity(day: "Sun", minutes: 25),
];