import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpController extends ChangeNotifier {

  List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());

  List<FocusNode> focusNodes =
  List.generate(6, (_) => FocusNode());

  String verificationId = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
    notifyListeners();
  }

  String getOtp() {
    return controllers.map((c) => c.text).join();
  }

  bool get isOtpComplete {
    return controllers.every((c) => c.text.isNotEmpty);
  }

  /// ✅ REAL VERIFY
  Future<void> verifyOtp(BuildContext context) async {

    String otp = getOtp();

    try {
      PhoneAuthCredential credential =
      PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);

      print("✅ LOGIN SUCCESS");

    } catch (e) {
      print("❌ OTP ERROR: $e");
    }
  }

  void resendOtp() {
    // later
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }
}