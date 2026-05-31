import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/appointment_controller.dart';
import '../widgets/appointment_card.dart';
import '../widgets/empty_state.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppointmentController(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<AppointmentController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10),
                  Text("Appointments",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),

              const SizedBox(height: 20),

              /// TAB SWITCH
              Row(
                children: [
                  _tab("Today", 0, controller),
                  const SizedBox(width: 10),
                  _tab("Upcoming", 1, controller),
                ],
              ),

              const SizedBox(height: 15),

              /// FILTERS
              Row(
                children: [
                  _filter("All", controller),
                  _filter("Pending", controller),
                  _filter("Confirmed", controller),
                  _filter("Cancelled", controller),
                ],
              ),

              const SizedBox(height: 10),

              Center(
                child: Text("Total = ${controller.filteredList.length}"),
              ),

              const SizedBox(height: 10),

              /// LIST
              Expanded(
                child: controller.filteredList.isEmpty
                    ? const EmptyState()
                    : ListView.builder(
                  itemCount: controller.filteredList.length,
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      data: controller.filteredList[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text, int index, controller) {
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: controller.selectedTab == index
              ? const Color(0xff7B5B44)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: controller.selectedTab == index
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _filter(String text, controller) {
    return GestureDetector(
      onTap: () => controller.changeFilter(text),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: controller.selectedFilter == text
              ? const Color(0xff7B5B44)
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff7B5B44)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: controller.selectedFilter == text
                ? Colors.white
                : const Color(0xff7B5B44),
          ),
        ),
      ),
    );
  }
}