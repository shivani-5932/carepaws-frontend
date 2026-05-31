import 'package:care_paws/core/navigation/app_navigator.dart'; // 👈 adjust path
import 'package:care_paws/features/services/dashboard_type.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String icon;
  final DashboardType type;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.navigateToDashboard(context, type);
      },

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xffEFE7DF),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xffC7A68C)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 60,
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff4E4038),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}