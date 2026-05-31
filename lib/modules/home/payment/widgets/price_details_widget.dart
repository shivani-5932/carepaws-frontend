import 'package:care_paws/modules/home/payment/payment_model.dart';
import 'package:flutter/material.dart';

class PriceDetailsWidget extends StatelessWidget {

  final PaymentModel model;

  const PriceDetailsWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text("Price Details"),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Consultation Fees"),
            Text("Rs ${model.consultationFee.toStringAsFixed(2)}"),
          ],
        ),

        const SizedBox(height: 6),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Other Charges & GST"),
            Text("Rs ${model.charges.toStringAsFixed(2)}"),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total"),
            Text(
              "Rs ${model.total.toStringAsFixed(2)}",
              style: const TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ],
    );
  }
}