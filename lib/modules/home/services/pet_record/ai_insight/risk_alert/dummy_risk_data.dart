import 'package:care_paws/modules/home/services/pet_record/ai_insight/risk_alert/risk_alert_model.dart';
import 'package:flutter/material.dart';


List<RiskModel> riskList = [

  RiskModel(
    title: "Rabies Vaccination Overdue",
    description: " Rabies Vaccine was due 2yrs",
    bgColor: Color(0x66BF221C), // red
    borderColor: Color(0xFFBF221C),
  ),

  RiskModel(
    title: "Weight Gain Risk",
    description: " Weight increased by 1.5 kg in last 2 months",
    bgColor: Color(0x66FE4406),
    borderColor: Color(0xFFFE4406),// orange
  ),

  RiskModel(
    title: "Low Water Intake",
    description: " Hydration below recommended level",
    bgColor: Color(0x6601A5DB),
    borderColor: Color(0xFF01A5DB),// blue
  ),

  RiskModel(
    title: "No Critical Issues Detected",
    description: "",
    bgColor: Color(0x6699F01A),
    borderColor: Color(0xFF78C00D),// green
  ),
];