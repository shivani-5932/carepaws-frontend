
import 'package:care_paws/modules/profile/apc/card_widget/appointment_card.dart';
import 'package:care_paws/modules/profile/apc/controller/appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppointmentScreen extends StatelessWidget {
  ProfileAppointmentScreen({super.key});

  final controller = Get.put(ProfileAppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("My Appointments"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Obx(() {
        final list = controller.appointments;

        /// EMPTY STATE
        if (list.isEmpty) {
          return const Center(
            child: Text(
              "No Appointment Yet !",
              style: TextStyle(
                color: Color(0xFF6B4F3B),
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }

        /// LIST STATE
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ProfileAppointmentCard(data: list[index]);
          },
        );
      }),
    );
  }
}