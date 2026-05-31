import 'package:care_paws/modules/profile/apc/card_widget/consultation_card.dart';
import 'package:care_paws/modules/profile/apc/controller/consultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsultationScreen extends StatelessWidget {
  ConsultationScreen({super.key});


  final controller = Get.put(ProfileConsultationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Consultation"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Obx(() {
        final list = controller.consultations;

        /// EMPTY STATE
        if (list.isEmpty) {
          return const Center(
            child: Text(
              "No Consultation Yet !",
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
            return ProfileConsultationCard(data: list[index]);
          },
        );
      }),
    );
  }
}