import 'package:flutter/material.dart';

class ActivityCard extends StatefulWidget {
  final String title;
  final String activity;
  final String duration;
  final TimeOfDay time;

  const ActivityCard({
    super.key,
    required this.title,
    required this.activity,
    required this.duration,
    required this.time,
  });

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  late TimeOfDay selectedTime;
  bool isDone = false;

  @override
  void initState() {
    selectedTime = widget.time;
    super.initState();
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour : $minute  $period";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              Checkbox(
                value: isDone,
                activeColor: Colors.green,
                onChanged: (val) {
                  setState(() {
                    isDone = val ?? false;
                  });
                },
              )
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Text("Time : "),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown.shade200),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(formatTime(selectedTime)),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  selectedTime.period == DayPeriod.am ? "AM" : "PM",
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(child: Text("${widget.activity}    ${widget.duration}")),
              const Text("Edit", style: TextStyle(color: Colors.orange))
            ],
          ),
        ],
      ),
    );
  }
}