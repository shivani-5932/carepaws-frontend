import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/profile/apc/card_widget/payment_card.dart';
import 'package:care_paws/modules/profile/apc/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final controller = Get.put(ProfilePaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFCFA),
      appBar: AppBar(
        title:  Text("Payments"),
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Obx(() {
        final list = controller.payments;

        /// EMPTY STATE
        if (list.isEmpty) {
          return  Center(
            child: Text(
              "No Payment Yet !",
              style: AppTextStyles.h1.copyWith(
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
            return ProfilePaymentCard(data: list[index]);
          },
        );
      }),
    );
  }
}