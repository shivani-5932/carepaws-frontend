import 'package:care_paws/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/login_controller.dart';
import '../../community/widget/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<LoginController>();
    final _formKey = GlobalKey<FormState>(); // ✅ ADDED

    return Scaffold(
      backgroundColor: const Color(0xffF5F2EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form( // ✅ ADDED
              key: _formKey,
              child: Column(
                children: [

                  const SizedBox(height: 20),

                  /// 🔘 Skip Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MainScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.brown),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("Skip"),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// 🐾 Logo
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.pets, color: Colors.brown, size: 40),
                  ),

                  const SizedBox(height: 20),

                  /// 📝 Title
                  Text(
                    controller.isVet ? "Welcome Vet" : "Welcome",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4E4038),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// 👤 Name
                  _buildField(
                    controller.nameController,
                    "Name",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Name required";
                      }
                      if (value.trim().length < 3) {
                        return "Name too short";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  /// 📞 Phone
                  _buildField(
                    controller.phoneController,
                    "Phone No",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone required";
                      }
                      if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return "Enter valid 10 digit number";
                      }
                      return null;
                    },
                  ),

                  /// 📧 Email (ONLY VET)
                  if (controller.isVet) ...[
                    const SizedBox(height: 16),
                    _buildField(
                      controller.emailController,
                      "Email",
                      validator: (value) {
                        if (controller.isVet) {
                          if (value == null || value.isEmpty) {
                            return "Email required";
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return "Enter valid email";
                          }
                        }
                        return null;
                      },
                    ),
                  ],

                  const SizedBox(height: 20),

                  /// 🚀 Next Button
                  PrimaryButton(
                    text: "Next",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.submit(context);
                      }
                    },
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "By continuing, you agree to our Terms of Service and Privacy Policy",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),

                  const SizedBox(height: 25),

                  /// 🔀 OR Divider
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// 🔵 Google Login
                  GestureDetector(
                    onTap: () => controller.googleLogin(context),
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/google.png"),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 🔁 Toggle Vet/User
                  GestureDetector(
                    onTap: controller.toggleUserType,
                    child: Text(
                      controller.isVet
                          ? "Continue as User ?"
                          : "Register as Vet ?",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ UPDATED FIELD (validation support)
  Widget _buildField(
      TextEditingController controller,
      String hint, {
        String? Function(String?)? validator,
        TextInputType? keyboardType,
      }) {
    return TextFormField( // ✅ CHANGED
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}