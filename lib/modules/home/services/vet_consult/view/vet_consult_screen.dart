import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:care_paws/modules/home/services/vet_consult/controller/vet_consult_controller.dart';
import 'package:care_paws/modules/home/services/vet_consult/widget/consultant_list_widget.dart';
import 'package:care_paws/modules/home/services/vet_consult/widget/speciality_grid_widget.dart';
import 'package:care_paws/modules/home/services/vet_consult/widget/suffering_grid_widget.dart';
import 'package:care_paws/modules/home/services/vet_consult/widget/urgency_button_widget.dart';
import 'package:flutter/material.dart';

class VetConsultScreen extends StatelessWidget {

  VetConsultScreen({super.key});

  final controller = VetConsultController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Color(0xFFFDFCFA), // base

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffE9DDD5), // top
              Color(0xffffffff), // bottom
            ],
          ),
        ),


        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: SingleChildScrollView(

              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  /// SEARCH
                  SearchBarWidget(
                    controller: TextEditingController(),
                  ),

                  const SizedBox(height: 16),

                  /// CONSULTANTS
                  ConsultantListWidget(data: controller.consultants),

                  const SizedBox(height: 24),

                  /// BUTTON
                  const UrgencyButtonWidget(),

                  const SizedBox(height: 16),

                  /// TITLE
                  Center(
                    child: Text(
                      "Find Vet by Speciality",
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w700, // bold Playfair
                        color: const Color(0xff4A3426),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// SPECIALITY GRID
                  SpecialityGridWidget(data: controller.specialities),

                  const SizedBox(height: 16),

                  /// TITLE
                  // const Center(
                  //   child: Text("Find Vet by Suffering"),
                  // ),
                  //
                  // const SizedBox(height: 16),

                  /// SUFFERING
                  // SufferingGridWidget(data: controller.sufferings),
                  //
                  // const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}