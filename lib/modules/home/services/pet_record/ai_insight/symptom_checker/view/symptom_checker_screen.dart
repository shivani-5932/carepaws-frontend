import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/services/pet_record/ai_insight/symptom_checker/view/symptom_checker_result_screen.dart';
import 'package:flutter/material.dart';

class SymptomCheckerScreen extends StatefulWidget {
  const SymptomCheckerScreen({super.key});

  @override
  State<SymptomCheckerScreen> createState() =>
      _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  final TextEditingController controller = TextEditingController();

  void handleCheck() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SymptomResultScreen(userInput: text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Symptom Checker"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// INPUT BOX
            TextField(
              controller: controller,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "What your pet is feeling ?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON (reuse style 🔥)
          PrimaryButton(
              text: "Check",
          onTap: handleCheck,),

          ],
        ),
      ),
    );
  }
}