import 'package:flutter/material.dart';

class MealCard extends StatefulWidget {
  final String title;
  final String food;
  final String quantity;
  final TimeOfDay time;

  const MealCard({
    super.key,
    required this.title,
    required this.food,
    required this.quantity,
    required this.time,
  });

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  late TimeOfDay selectedTime;
  late String food;
  late String quantity;
  bool isDone = false;

  @override
  void initState() {
    selectedTime = widget.time;
    food = widget.food;
    quantity = widget.quantity;
    super.initState();
  }

  /// ⏰ TIME PICKER
  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  /// ✏ EDIT FOOD + QUANTITY
  void editMeal() {
    final foodController = TextEditingController(text: food);
    final qtyController = TextEditingController(text: quantity);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Meal"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: foodController,
              decoration: const InputDecoration(labelText: "Food"),
            ),
            TextField(
              controller: qtyController,
              decoration: const InputDecoration(labelText: "Quantity"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                food = foodController.text;
                quantity = qtyController.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour : $minute";
  }

  String get period =>
      selectedTime.period == DayPeriod.am ? "AM" : "PM";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE + CHECKBOX
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

          const SizedBox(height: 8),

          /// 🔥 TIME ROW (EXACT UI MATCH)
          Row(
            children: [
              const Text("Time : "),
              GestureDetector(
                onTap: pickTime,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(formatTime(selectedTime)),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B4F3B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          period,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// 🔥 FOOD ROW (EXACT SPACING + EDIT)
          Row(
            children: [
              Expanded(
                child: Text("$food    $quantity"),
              ),
              GestureDetector(
                onTap: editMeal,
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.orange),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}