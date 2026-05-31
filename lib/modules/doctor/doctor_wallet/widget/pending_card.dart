import 'package:flutter/material.dart';

class PendingCard extends StatelessWidget {

  const PendingCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0D5C8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("Pending Amount"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Rs 3200", style: TextStyle(color: Colors.orange)),
              Text("To be credited", style: TextStyle(fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}