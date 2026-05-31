import 'package:care_paws/modules/doctor/doctor_dashboard/controller/doc_dashboard_controller.dart';
import 'package:care_paws/modules/doctor/doctor_dashboard/widget/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DoctorDashboardController(),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<DoctorDashboardController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              /// 🔔 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        controller.doctorName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [

                      const Icon(Icons.notifications_none),

                      const SizedBox(width: 10),

                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          color: Color(0xff7B5B44),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "8",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// 🟫 GRID CARDS
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14,
                  crossAxisSpacing:14,
                  childAspectRatio: 2.8,
                ),
                itemBuilder: (context, index) {

                  final item = controller.menuItems[index];

                  return DashboardCard(
                    title: item.title,
                    icon: item.icon,
                    type: item.type,

                  );
                },
              ),

              const SizedBox(height: 30),

              /// 🩺 IMAGE (BOTTOM)
              Expanded(
                child: Center(
                  child: Image.asset(
                    "assets/images/stethoscope.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}