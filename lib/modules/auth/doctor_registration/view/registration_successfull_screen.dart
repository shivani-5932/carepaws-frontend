import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/homepage/homepage_screen.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F2EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 40),

              /// 🐾 ROUNDED SQUARE AVATAR (REUSABLE STYLE)
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xffE8DED6),
                  borderRadius: BorderRadius.circular(30), // 🔥 rounded square
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "assets/images/success.png", // 👈 change if needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ✅ TITLE
              const Text(
                "Your Registration has been Submitted Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6BBF2A), // green
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              /// 🟤 SUBTITLE
              const Text(
                "Thank you for Joining CarePaws",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff4E4038),
                ),
              ),

              const SizedBox(height: 20),

              /// 📄 DESCRIPTION
              const Text(
                "Our team will review your profile.You will receive an email shortly regarding the next steps.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff4E4038),
                ),
              ),

              const SizedBox(height: 10),

              /// 🔥 LAST PARA (BOLD)
              const Text(
                "Once approved, your profile will be listed on the app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600, // 🔥 bold
                  color: Color(0xff4E4038),
                ),
              ),

              const Spacer(),

              /// 🚀 FINISH BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommunityHomePage(),
                      ),
                          (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7B5B44),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Finish",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}