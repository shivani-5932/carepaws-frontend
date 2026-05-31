import 'package:care_paws/modules/doctor/growth/widgets/bar_chart.dart';
import 'package:care_paws/modules/doctor/growth/widgets/earnings_chart.dart';
import 'package:care_paws/modules/doctor/growth/widgets/growth_header.dart';
import 'package:care_paws/modules/doctor/growth/widgets/pie_chart.dart';
import 'package:care_paws/modules/doctor/growth/widgets/stat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/growth_controller.dart';

class GrowthScreen extends StatelessWidget {
  const GrowthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GrowthController(),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GrowthController>();
    final data = controller.current;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔙 HEADER WITH BACK
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Growth",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// 👤 HEADER
              const GrowthHeader(),

              const SizedBox(height: 20),

              /// 🔥 TABS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.tabs.length,
                        (i) => GestureDetector(
                      onTap: () => controller.changeTab(i),
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: controller.selectedTab == i
                              ? const Color(0xff7B5B44)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          controller.tabs[i],
                          style: TextStyle(
                            color: controller.selectedTab == i
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// 💰 TOTAL EARNINGS CARD (PREMIUM)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff7B5B44),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Earnings",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Rs ${data.totalEarnings}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 📈 EARNINGS CHART
              const Text(
                "Earnings Trend",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              EarningsChart(data: data.earnings),

              const SizedBox(height: 20),

              /// 📊 APPOINTMENTS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Appointments",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${data.appointments.reduce((a, b) => a + b)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              BarChartWidget(data: data.appointments),

              const SizedBox(height: 20),

              /// 📌 STATS
              const Text(
                "Performance",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              const StatTile(title: "Rating", value: "⭐ 4.9"),

              StatTile(
                title: "Patients Served",
                value: data.patients.toString(),
              ),

              const SizedBox(height: 20),

              /// 🥧 PIE CHART
              const Text(
                "Earning Breakdown",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              PieChartWidget(data: data.earnings),

              const SizedBox(height: 20),

              /// 💵 EXTRA STATS
              const StatTile(title: "Video Call", value: "Rs 7000"),
              const StatTile(title: "Call", value: "Rs 3000"),
              const StatTile(title: "Message", value: "Rs 2600"),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}