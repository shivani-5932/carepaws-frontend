import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';
import '../model/appointment_model.dart';

class AppointmentCard extends StatelessWidget {

  final AppointmentModel data;

  const AppointmentCard({super.key, required this.data});

  Color getStatusColor() {
    switch (data.status) {
      case "pending":
        return Colors.blue;
      case "confirmed":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.ownerName,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                data.status[0].toUpperCase() + data.status.substring(1),
                style: TextStyle(
                  color: getStatusColor(),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text("Pet’s Name : ${data.petName}"),
          Text("Video Call | 25 min", style: const TextStyle(fontSize: 12)),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.dateTime, style: const TextStyle(fontSize: 11)),
              Text(data.price, style: const TextStyle(color: Colors.orange)),
            ],
          ),

          const SizedBox(height: 10),

          /// BUTTONS (ONLY PENDING)
          if (data.status == "pending")
            Row(
              children: [
                Expanded(
                  child: ContrastButton(
                    text: "Cancel",
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    text: "Confirm",
                    onTap: () {},
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}