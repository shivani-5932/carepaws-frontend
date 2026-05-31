import 'package:flutter/material.dart';

class WaterIntakeScreen extends StatefulWidget {
  const WaterIntakeScreen({super.key});

  @override
  State<WaterIntakeScreen> createState() => _WaterIntakeScreenState();
}

class _WaterIntakeScreenState extends State<WaterIntakeScreen> {
  bool isChecked = false;
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Water Intake"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isSubmitted
            ? _buildSuccessCard() // ✅ SUCCESS UI
            : Column(
          children: [

            /// INPUT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [

                  const Text(
                    "Tuffy | 2 yrs | 12 kg",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text("Water Intake"),

                  const SizedBox(height: 10),

                  const Text(
                    "Insight : “1.5 L daily”",
                    style: TextStyle(fontSize: 12),
                  ),

                  const SizedBox(height: 20),

                  /// CHECKBOX
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.brown.shade300),
                        color: isChecked
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      child: isChecked
                          ? const Icon(Icons.check,
                          color: Colors.white, size: 18)
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isChecked
                      ? const Color(0xFF6B4F3B)
                      : Colors.brown.shade200,
                ),
                onPressed: isChecked
                    ? () {
                  setState(() {
                    isSubmitted = true;
                  });
                }
                    : null,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ SUCCESS CARD
  Widget _buildSuccessCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8ED1E5), // light blue
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 70,
        child: Column(
          children: const [
            Text(
              "Congratulations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "“Your pet completed the water daily intake level”",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}