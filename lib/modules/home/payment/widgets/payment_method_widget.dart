import 'package:flutter/material.dart';

class PaymentMethodWidget extends StatelessWidget {

  final String title;
  final String icon;
  final VoidCallback onTap;

  const PaymentMethodWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),

        child: Row(
          children: [

            Image.asset(icon, height: 24),

            const SizedBox(width: 12),

            Expanded(child: Text(title)),

            const Icon(Icons.add, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}