import 'package:care_paws/modules/doctor/doctor_wallet/model/wallet_model.dart';
import 'package:flutter/material.dart';


class StatsRow extends StatelessWidget {

  final WalletModel data;

  const StatsRow({super.key, required this.data});

  Widget box(String title, int value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: const Color(0xffF9F6F2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffE0D5C8)),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 11)),
            Text("Rs $value", style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        box("Today", data.today),
        box("This Week", data.week),
        box("This month", data.month),
      ],
    );
  }
}