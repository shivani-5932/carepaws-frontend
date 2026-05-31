import 'package:care_paws/modules/home/services/pet_record/health_record/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/health_controller.dart';

class VetVisitLogsScreen extends StatelessWidget {
  const VetVisitLogsScreen({super.key});

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
          "Vet Visit / Consultation Logs",
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
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF6B4F3B),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),

              const SizedBox(height: 16),

              /// 🔹 MODEL BASED LIST
              Expanded(
                child: Obx(() => ListView.separated(
                  itemCount: controller.pets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),

                  itemBuilder: (context, index) {

                    final pet = controller.pets[index];

                    return CommonRecordCard(
                      petName: pet.name,
                      // title: "Vet Visits",

                      records: pet.visits.map((v) => {
                        "name": v.name,
                        "date": v.date,
                        "icon": "assets/icons/eye.svg",
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