import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF9F6F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0D5C8)),
      ),
      child: Column(
        children: [

          /// HEADER
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Bank Details",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Text("Edit",
                    style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),

          Divider(color: Colors.grey.shade300, height: 1),

          /// DETAILS
          const Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("HDFC Bank"),
                Text("**** 5678",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}