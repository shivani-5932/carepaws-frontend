import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class SymptomResultScreen extends StatefulWidget {
  final String userInput;

  const SymptomResultScreen({super.key, required this.userInput});

  @override
  State<SymptomResultScreen> createState() =>
      _SymptomResultScreenState();
}

class _SymptomResultScreenState extends State<SymptomResultScreen> {
  String response = "Loading...";

  @override
  void initState() {
    super.initState();
    getAIResponse();
  }

  Future<void> getAIResponse() async {
    /// TEMP DUMMY (replace with API 🔥)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      response =
      "Condition: Mild infection\n\nExplanation: Your pet may have minor discomfort.\n\nWhat to do: Keep hydrated & monitor.\n\nRecommendation: Visit vet if condition worsens.";
    });
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

            Expanded(
              child: SingleChildScrollView(
                child: Text(response),
              ),
            ),

            /// BUTTON
          PrimaryButton(
              text: "Consult a vet",
          onTap: (){

           },
          )
          ],
        ),
      ),
    );
  }
}