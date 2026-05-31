import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/profile/edit_profile/custom_textfield.dart';
import 'package:care_paws/modules/profile/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditProfileScreen extends StatelessWidget {
  final bool isDoctor;

  EditProfileScreen({super.key, required this.isDoctor});

  final controller = Get.put(EditProfileController());

  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final dobCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// PROFILE IMAGE
            Stack(
              children: [
                ProfileAvatarWidget(
                    image: "assets/images/doctor.png",
                    size:75),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt, size: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Text("Ashdeep",
                style: TextStyle(fontWeight: FontWeight.bold)),

            const Text("ash@gmail.com",
                style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 20),

            /// INPUTS
            CustomTextField(hint: "Name", controller: nameCtrl),
            const SizedBox(height: 15),

            CustomTextField(hint: "Phone No", controller: phoneCtrl),
            const SizedBox(height: 15),

            /// ONLY FOR DOCTOR
            if (isDoctor) ...[
              CustomTextField(hint: "Email", controller: emailCtrl),
              const SizedBox(height: 15),
            ],

            /// DOB
            CustomTextField(
              hint: "DOB",
              controller: dobCtrl,
              suffix: const Icon(Icons.calendar_today),
            ),

            const SizedBox(height: 15),

            /// ONLY DOCTOR
            if (isDoctor)
              const Text(
                "Other Details",
                style: TextStyle(color: Colors.orange),
              ),

            const SizedBox(height: 40),

            /// SAVE BUTTON
            PrimaryButton(
               text: "Save Changes",
               onTap: () {
                  // action
               }
            ),

            const SizedBox(height: 10),

            /// USER ONLY
            if (!isDoctor)
              const Text(
                "Register as Vet ?",
                style: TextStyle(color: Colors.orange),
              ),
          ],
        ),
      ),
    );
  }
}