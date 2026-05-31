import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Appointment Yet !",
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff6F625A),
        ),
      ),
    );
  }
}