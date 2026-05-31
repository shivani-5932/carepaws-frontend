import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/pet_diet_management/diet_plan/widget/meal_card.dart';
import 'package:flutter/material.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Diet Plan"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
        
                /// HEADER
                const Text("Tuffy | 2 yrs | 12 kg",
                    style: TextStyle(fontWeight: FontWeight.bold)),
        
                const SizedBox(height: 6),
        
                const Text("Diet Plan"),
        
                const SizedBox(height: 12),
        
                /// MEALS
                MealCard(
                  title: "Morning",
                  food: "Chicken & Rice",
                  quantity: "250 g",
                  time: const TimeOfDay(hour: 9, minute: 41),
                ),
        
                MealCard(
                  title: "Afternoon",
                  food: "Dry Food",
                  quantity: "260 g",
                  time: const TimeOfDay(hour: 12, minute: 41),
                ),
        
                MealCard(
                  title: "Evening",
                  food: "Wet Food",
                  quantity: "200 g",
                  time: const TimeOfDay(hour: 21, minute: 0),
                ),
        
                const SizedBox(height: 10),
        
                /// INSIGHT
                const Text(
                  "Insight : “Reduce treats And increase protein”",
                  style: TextStyle(fontSize: 12),
                ),
        
                const SizedBox(height: 15),
        
                /// BUTTON
                PrimaryButton(
                    text: "Add Meal",
                    onTap: (){

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}