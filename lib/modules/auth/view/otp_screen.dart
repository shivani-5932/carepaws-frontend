// import 'package:care_paws/modules/auth/doctor_registration/view/verification_screen.dart';
// import 'package:care_paws/modules/community/homepage/homepage_screen.dart';
// import 'package:care_paws/modules/community/widget/primary_button.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../controller/otp_controller.dart';
//
// class OtpScreen extends StatelessWidget {
//   final bool isVetFlow;
//
//   const OtpScreen({super.key, required this.isVetFlow});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => OtpController(),
//       child: const _OtpView(),
//     );
//   }
// }
//
// class _OtpView extends StatelessWidget {
//   const _OtpView();
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = context.watch<OtpController>();
//
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F2EF),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             children: [
//
//               const SizedBox(height: 50),
//
//               /// ✅ Logo (refined color)
//               Container(
//                 height: 90,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Color(0xff6B4B35)),
//                 ),
//                 child: const Icon(
//                   Icons.pets,
//                   color: Color(0xff6B4B35),
//                   size: 42,
//                 ),
//               ),
//
//               const SizedBox(height: 22),
//
//               /// ✅ Title (exact style)
//               const Text(
//                 "Enter OTP",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff4A3426),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               /// ✅ OTP BOXES (exact UI)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(
//                   6,
//                       (index) => SizedBox(
//                     width: 44,
//                     height: 50,
//                     child: TextField(
//                       controller: controller.controllers[index],
//                       focusNode: controller.focusNodes[index],
//                       keyboardType: TextInputType.number,
//                       textAlign: TextAlign.center,
//                       maxLength: 1,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xff4A3426),
//                       ),
//                       decoration: InputDecoration(
//                         counterText: "",
//                         filled: true,
//                         fillColor: const Color(0xffF7F2EE),
//                         contentPadding: EdgeInsets.zero,
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Color(0xffD6C6BA),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(
//                             color: Color(0xff6B4B35),
//                           ),
//                         ),
//                       ),
//                       onChanged: (value) =>
//                           controller.onChanged(value, index),
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 36),
//
//               /// ✅ Verify Button (same, spacing fixed)
//               PrimaryButton(
//                 text: "Verify",
//                 onTap: controller.isOtpComplete
//                     ? () {
//
//                   controller.verifyOtp();
//
//                   if ((context.findAncestorWidgetOfExactType<OtpScreen>() as OtpScreen).isVetFlow) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const VerificationScreen(),
//                       ),
//                     );
//                   } else {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => CommunityHomePage(),
//                       ),
//                     );
//                   }
//
//                 }
//                     : null,
//               ),
//
//               const SizedBox(height: 22),
//
//               /// ✅ Resend Text (styled)
//               GestureDetector(
//                 onTap: controller.resendOtp,
//                 child: const Text(
//                   "Didn’t receive OTP ? Resend",
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Color(0xff8B6F5A),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:care_paws/main_screen.dart';
import 'package:care_paws/modules/auth/doctor_registration/view/verification_screen.dart';
import 'package:care_paws/modules/community/homepage/homepage_screen.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/otp_controller.dart';

class OtpScreen extends StatelessWidget {

  final bool isVetFlow;
  final String verificationId;

  const OtpScreen({
    super.key,
    required this.isVetFlow,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OtpController()..verificationId = verificationId,
      child: const _OtpView(),
    );
  }
}

class _OtpView extends StatelessWidget {
  const _OtpView();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<OtpController>();

    return Scaffold(
      backgroundColor: const Color(0xffF5F2EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 60),

              /// 🐾 Logo
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.brown),
                ),
                child: const Icon(
                  Icons.pets,
                  color: Colors.brown,
                  size: 45,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Enter OTP",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff4E4038),
                ),
              ),

              const SizedBox(height: 30),

              /// 🔢 OTP BOXES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 45,
                    height: 50,
                    child: TextField(
                      controller: controller.controllers[index],
                      focusNode: controller.focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color(0xffC7A68C),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.brown,
                          ),
                        ),
                      ),
                      onChanged: (value) =>
                          controller.onChanged(value, index),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              /// 🚀 VERIFY BUTTON
              PrimaryButton(
                text: "Verify",
                onTap: controller.isOtpComplete
                    ? () {

                  controller.verifyOtp(context);

                  if ((context.findAncestorWidgetOfExactType<OtpScreen>() as OtpScreen).isVetFlow) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VerificationScreen(),
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainScreen(),
                      ),
                    );
                  }

                }
                    : null, // 🔥 disabled
              ),

              const SizedBox(height: 20),

              /// 🔁 RESEND
              GestureDetector(
                onTap: () => controller.verifyOtp(context),
                child: const Text(
                  "Didn't receive OTP ? Resend",
                  style: TextStyle(
                    color: Color(0xff6F625A),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}