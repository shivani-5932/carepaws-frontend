import 'package:flutter/material.dart';

class IncomeTile extends StatelessWidget {

  final String title;
  final String amount;

  const IncomeTile({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(amount, style: const TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}