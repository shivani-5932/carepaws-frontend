import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_controller.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_success/widget/refund_info_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_success/widget/success_image_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_success/widget/success_text_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/doctor_card_widget.dart';
import 'package:flutter/material.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
        
            child: Column(
              children: [
        
                /// 🔥 BACK + TITLE
                Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 10),
                    Text(
                      "Summary",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
        
                const SizedBox(height: 20),
        
                /// 🔥 DOC CARD (reuse your existing)
                DoctorCardWidget(data: doctors[0]),
        
                // const SizedBox(height: 16),
        
                /// 🔥 SUCCESS IMAGE (CHANGED)
                const SuccessImageWidget(
                  image: "assets/images/success.png", // 👈 your custom image
                ),
                // ProfileAvatarWidget(
                //     image: "assets/images/success.png",
                //     size: 220),
        
                const SizedBox(height: 16),
        
                /// TEXT
                const SuccessTextWidget(),
        
                const SizedBox(height: 16),
        
                /// REFUND BOX
                const RefundInfoWidget(),
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}