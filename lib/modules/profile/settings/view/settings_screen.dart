import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/profile/settings/controller/settings_controller.dart';
import 'package:care_paws/modules/profile/settings/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFCFA),
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// DELETE ACCOUNT
            ListTile(
              title:  Text("Delete Account",
              style: AppTextStyles.bodyMedium,),
              onTap: () {
                showConfirmSheet(
                  title: "Are you sure to delete the account permanently ?",
                  confirmText: "Delete",
                  onConfirm: controller.deleteAccount,
                );
              },
            ),

            /// NOTIFICATIONS (TOGGLE HERE ONLY 🔥)
            Obx(() => SwitchListTile(
              title: Text("Notifications",
                  style: AppTextStyles.bodyMedium),
              value: controller.notificationsEnabled.value,
              activeColor: const Color(0xFF6B4F3B),
              onChanged: controller.toggleNotification,
            )),

            const Spacer(),

            /// LOGOUT
            GestureDetector(
              onTap: () {
                showConfirmSheet(
                  title: "Are you sure to Log out the account ?",
                  confirmText: "Logout",
                  onConfirm: controller.logout,
                );
              },
              child:  Padding(
                padding:  EdgeInsets.only(bottom: 25),
                child: Text(
                  "Log out",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
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