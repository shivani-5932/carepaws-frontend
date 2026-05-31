import 'package:care_paws/modules/home/services/pet_record/ai_insight/risk_alert/dummy_risk_data.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/risk_alert/risk_card.dart';
import 'package:flutter/material.dart';


class RiskAlertScreen extends StatelessWidget {
  const RiskAlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Risk Alert"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: riskList.length,
        itemBuilder: (context, index) {
          return RiskCard(
            data: riskList[index],
          );
        },
      ),
    );
  }
}