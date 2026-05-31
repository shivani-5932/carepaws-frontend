import 'package:flutter/material.dart';
import 'activity_card.dart';

class ActivitySummaryCard extends StatelessWidget {
  const ActivitySummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          Text("Tuffy | 2 yrs | 12 kg",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text("Activity Summary"),
          SizedBox(height: 12),

          ActivityCard(
            title: "Morning",
            activity: "Walk",
            duration: "30m",
            time: TimeOfDay(hour: 9, minute: 41),
          ),

          ActivityCard(
            title: "Morning",
            activity: "Dance",
            duration: "7 min",
            time: TimeOfDay(hour: 9, minute: 41),
          ),

          SizedBox(height: 10),

          Text(
            'Insight :  “Wow your pet is very active”',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}