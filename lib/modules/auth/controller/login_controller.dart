import 'package:care_paws/modules/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../../auth/view/otp_screen.dart';

class LoginController extends ChangeNotifier {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final AuthService _auth = AuthService(); // 🔥 ADD

  bool isVet = false;

  UserModel? user;
  String? verificationId; // 🔥 ADD

  void toggleUserType() {
    isVet = !isVet;
    notifyListeners();
  }

  /// 🔥 PHONE SUBMIT (OTP SEND)
  Future<void> submit(BuildContext context) async {

    user = UserModel(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      email: isVet ? emailController.text.trim() : null,
      isVet: isVet,
    );

    await _auth.sendOTP(
      phone: "+91${phoneController.text.trim()}",
      codeSent: (verId) {

        verificationId = verId;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(
              isVetFlow: isVet,
              verificationId: verificationId!, // 🔥 PASS
            ),
          ),
        );
      },
    );
  }

  /// 🔥 GOOGLE LOGIN
  Future<void> googleLogin(BuildContext context) async {

    final user = await _auth.signInWithGoogle();

    if (user != null) {
      print("Google Login Success");

      Navigator.pushReplacementNamed(context, "/main"); // ya MainScreen
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}