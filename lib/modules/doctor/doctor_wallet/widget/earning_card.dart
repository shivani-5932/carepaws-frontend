import 'package:flutter/material.dart';

class EarningsCard extends StatelessWidget {

  final int total;

  const EarningsCard({super.key, required this.total});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffC7A68C), Color(0xff7B5B44)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Earnings : Rs $total",
            style: const TextStyle(color: Colors.white),
          ),
          const Icon(Icons.monetization_on, color: Colors.white)
        ],
      ),
    );
  }
}