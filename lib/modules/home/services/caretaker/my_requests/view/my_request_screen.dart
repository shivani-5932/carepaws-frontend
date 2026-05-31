import 'package:care_paws/modules/home/services/caretaker/my_requests/controller/my_request_controller.dart';
import 'package:care_paws/modules/home/services/caretaker/my_requests/widget/my_request_card.dart';
import 'package:care_paws/modules/profile/settings/widget/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:provider/provider.dart';


class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyRequestController());

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text("My Requests",
            style: TextStyle(color: Colors.black)),

        /// 🔥 DELETE BUTTON
        actions: [
          if (controller.isSelectionMode)
            TextButton(
              onPressed: () {
                showConfirmSheet(
                  title: "Are you sure you want to delete selected requests?",
                  confirmText: "Delete",
                  onConfirm: () {
                    controller.deleteSelected();
                    Get.back(); // close bottom sheet
                  },
                );
              },
              child: const Text("Delete",
                  style: TextStyle(color: Colors.red)),
            )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return MyRequestCard(
              isSelected:
              controller.selectedIndexes.contains(index),
              selectionMode: controller.isSelectionMode,

              onLongPress: () {
                controller.onLongPress(index);
              },

              onTap: () {
                if (controller.isSelectionMode) {
                  controller.toggleSelection(index);
                } else {
                  // navigate to details
                  Navigator.pushNamed(context, '/viewDetails');
                }
              },
            );
          },
        ),
      ),
    );
  }
}