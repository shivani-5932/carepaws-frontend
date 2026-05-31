import 'package:care_paws/modules/auth/doctor_registration/widget/upload_card_widget.dart';
import 'package:flutter/material.dart';

class VerifyYourselfScreen extends StatefulWidget {
  const VerifyYourselfScreen({super.key});

  @override
  State<VerifyYourselfScreen> createState() => _VerifyYourselfScreenState();
}

class _VerifyYourselfScreenState extends State<VerifyYourselfScreen> {

  bool isFrontUploaded = false;
  bool isBackUploaded = false;

  bool get isAllUploaded => isFrontUploaded && isBackUploaded;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF7F4F2),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const SizedBox(height: 30),

            const Text(
              "Upload Aadhaar Card For",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const Text(
              "Verification",
              style: TextStyle(color: Colors.green),
            ),

            const SizedBox(height: 10),

            const Text("Upload Aadhaar Card"),

            const SizedBox(height: 20),

            /// FRONT
            UploadDocumentCard(
              label: "Front",
              isUploaded: isFrontUploaded,
              onTap: () {
                setState(() => isFrontUploaded = true);
              },
            ),

            const SizedBox(height: 20),

            /// BACK
            UploadDocumentCard(
              label: "Back",
              isUploaded: isBackUploaded,
              onTap: () {
                setState(() => isBackUploaded = true);
              },
            ),

            const Spacer(),

            /// BUTTON
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),

              decoration: BoxDecoration(
                color: isAllUploaded
                    ? const Color(0xff6F4E37)
                    : const Color(0xffC7BDB5),

                borderRadius: BorderRadius.circular(10),
              ),

              child: GestureDetector(
                onTap: isAllUploaded
                    ? () {
                  Navigator.pop(context, true);
                }
                    : null,

                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}