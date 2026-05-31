import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/option_chip.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/progress_bar.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class OtherDetails2 extends StatefulWidget {
  const OtherDetails2({super.key});

  @override
  State<OtherDetails2> createState() => _OtherDetails2State();
}

class _OtherDetails2State extends State<OtherDetails2> {

  List<String> selectedLanguages = [];
  String selectedMode = "";

  final TextEditingController chargesController = TextEditingController();

  final languages = ["Hindi", "English", "Punjabi", "Haryanvi", "Urdu"];
  final modes = ["Call", "Video Call", "Message", "Vet Visit", "Clinic Visit"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF7F4F2),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// TOP BAR
            const SizedBox(height: 10),
            const TopProgressBar(step: 2),

            const SizedBox(height: 20),

            /// LANGUAGES
            const Text(
              "Select Your Preferable languages during Consultation",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: languages.map((lang) {
                return SelectChip(
                  text: lang,
                  isSelected: selectedLanguages.contains(lang),
                  onTap: () {
                    setState(() {
                      selectedLanguages.contains(lang)
                          ? selectedLanguages.remove(lang)
                          : selectedLanguages.add(lang);
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// MODE
            const Text(
              "Select Mode of Appointment",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: modes.map((mode) {
                return SelectChip(
                  text: mode,
                  isSelected: selectedMode == mode,
                  onTap: () {
                    setState(() {
                      selectedMode = mode;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// CHARGES
            const Text(
              "Charges for Consultation",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: chargesController,
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: "eg. Rs 200",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            /// NEXT BUTTON
            PrimaryButton(
              text: "Next",
              onTap: () async{


                final result = await Navigator.pushNamed(context, '/other3');


                if (result == true) {
                  Navigator.pop(context, true);
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}