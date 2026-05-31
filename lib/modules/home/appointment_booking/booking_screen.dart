import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_controller.dart';
import 'package:care_paws/modules/home/appointment_booking/widgets/date_selector_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/widgets/mode_selector_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/widgets/slot_section_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/doctor_card_widget.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final controller = BookingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(

            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                /// 🔥 DOC CARD (reuse your existing)
                DoctorCardWidget(data: doctors[0]),

                const SizedBox(height: 10),

                 Text("Select Mode of Appointment",
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.w700
                ),),

                const SizedBox(height: 10),

                ModeSelectorWidget(
                  controller: controller,
                  onSelect: (m){
                    setState(() => controller.selectMode(m));
                  },
                ),

                const SizedBox(height: 20),

                 Text("Select Date",
                  style: AppTextStyles.h2.copyWith(
                      fontWeight: FontWeight.w700
                  ),
                ),

                const SizedBox(height: 10),

                DateSelectorWidget(
                  controller: controller,
                  onSelect: (i){
                    setState(() => controller.selectDate(i));
                  },
                ),

                const SizedBox(height: 20),

                /// 🔥 LEAVE CONDITION
                if(controller.isLeaveDay())
                  Center(
                    child: Text(
                      "Doctor is on leave",
                       style: AppTextStyles.h2.copyWith(
                         fontWeight: FontWeight.w700,
                         color: Colors.red,
                      ),
                    ),
                  )
                else ...[

                  SlotSectionWidget(
                    title: "Morning",
                    slots: controller.model.slots["Morning"]!,
                    controller: controller,
                    onSelect: (s){
                      setState(() => controller.selectSlot(s));
                    },
                  ),

                  SlotSectionWidget(
                    title: "Afternoon",
                    slots: controller.model.slots["Afternoon"]!,
                    controller: controller,
                    onSelect: (s){
                      setState(() => controller.selectSlot(s));
                    },
                  ),

                  SlotSectionWidget(
                    title: "Evening",
                    slots: controller.model.slots["Evening"]!,
                    controller: controller,
                    onSelect: (s){
                      setState(() => controller.selectSlot(s));
                    },
                  ),

                ],

                const SizedBox(height: 20),

                /// CONTINUE
                 PrimaryButton(
                      text: "Continue Booking",
                      onTap: () {
                              // action
                              Navigator.pushNamed(context, '/bookSuccess');
                       },
                   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}