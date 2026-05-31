import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/custom_dropdown.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/progress_bar.dart';
import 'package:care_paws/modules/auth/doctor_registration/widget/other_details/section_tile.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';

class OtherDetails1 extends StatefulWidget {
  const OtherDetails1({super.key});

  @override
  State<OtherDetails1> createState() => _OtherDetails1State();
}

class _OtherDetails1State extends State<OtherDetails1> {

  String specialization = "";
  String experience = "";
  String degree = "";

  final TextEditingController otherDegree = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffF7F4F2),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            TopProgressBar(step: 1),

            const SizedBox(height: 20),

            const SectionTitle(text: "Select Your Speciality"),

            const SizedBox(height: 8),

            CustomDropdownField(
              hint: "General Vet",
              value: specialization,
              onTap: () {},
            ),

            const SizedBox(height: 16),

            const SectionTitle(text: "Select Your Years of Experience"),

            const SizedBox(height: 8),

            CustomDropdownField(
              hint: "8 months",
              value: experience,
              onTap: () {},
            ),

            const SizedBox(height: 16),

            const SectionTitle(text: "Higher Degree of Education"),

            const SizedBox(height: 8),

            CustomDropdownField(
              hint: "MBBS",
              value: degree,
              onTap: () {},
            ),

            const SizedBox(height: 16),

            const SectionTitle(text: "Other Degrees and Education"),

            const SizedBox(height: 8),

            TextField(
              controller: otherDegree,
              decoration: InputDecoration(
                hintText: "AFIH",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            PrimaryButton(
              text: "Next",
              onTap: () async{


                final result = await Navigator.pushNamed(context, '/other2');

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