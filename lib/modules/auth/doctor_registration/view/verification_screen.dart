import 'package:care_paws/modules/auth/doctor_registration/widget/verification_card_widget.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  bool isVetDone = false;
  bool isOtherDone = false;
  bool isVerifyDone = false;

  bool get isAllDone => isVetDone && isOtherDone && isVerifyDone;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF7F4F2),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// TITLE
              const Text(
                "Verification",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),

              /// IMAGE
              Center(
                child: Image.asset(
                  "assets/images/doctor.png",
                  height: 120,
                ),
              ),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  "To ensure safety and trust, please\nfill the following details",
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              /// VET LICENSE
              VerificationCard(
                title: "Vet license",
                iconPath: "assets/icons/vet.svg",
                isCompleted: isVetDone,
                onTap: () async {

                  /// navigate → return result
                  final result = await Navigator.pushNamed(
                    context,
                    '/vetLicense',
                  );

                  if (result == true) {
                    setState(() => isVetDone = true);
                  }
                },
              ),

              const SizedBox(height: 12),

              /// OTHER DETAILS
              VerificationCard(
                title: "Other Details",
                iconPath: "assets/icons/other.svg",
                isCompleted: isOtherDone,
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/other1',
                  );

                  if (result == true) {
                    setState(() => isOtherDone = true);
                }

                  // setState(() => isOtherDone = true);

                },
              ),

              const SizedBox(height: 12),

              /// VERIFY YOURSELF
              VerificationCard(
                title: "Verify Yourself",
                iconPath: "assets/images/verify.png",
                isCompleted: isVerifyDone,
                onTap: () async {

                  final result = await Navigator.pushNamed(
                    context,
                    '/verifyYourself',
                  );

                  if (result == true) {
                    setState(() => isVerifyDone = true);
                  }
                },
              ),

              const Spacer(),

              /// NEXT BUTTON
              PrimaryButton(
                text: "Next",
                onTap: () {
                  // action
                  isAllDone ? Navigator.pushNamed(context, '/registrationSuccess') : null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}