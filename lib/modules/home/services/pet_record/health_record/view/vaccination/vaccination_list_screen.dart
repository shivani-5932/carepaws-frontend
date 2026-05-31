import 'package:care_paws/modules/home/services/pet_record/health_record/controller/health_controller.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/vaccination/widget/vaccination_record_card.dart';
import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import your button if needed

class VaccinationRecordScreen extends StatelessWidget {
  const VaccinationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HealthController());

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      appBar: AppBar(
        backgroundColor: Color(0xFFFDFCFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Vaccination Record",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              /// ➕ Add Button
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B4F3B),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),

              const SizedBox(height: 32),

              /// 🔹 MODEL BASED LIST
              Expanded(
                child: Obx(() => ListView.separated(
                  itemCount: controller.pets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),

                  itemBuilder: (context, index) {

                    final pet = controller.pets[index];
                    return CommonRecordCard(
                      petName: pet.name,

                      records: pet.vaccinations.map((v) => {
                        "name": v.name,
                        "date": v.date,
                        "icon": "assets/icons/vaccine.svg",
                      }).toList(),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}