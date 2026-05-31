import 'package:flutter/material.dart';

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        "Sun","Mon","Tue","Wed","Thu","Fri","Sat"
      ].map((e) => Text(e)).toList(),
    );
  }
}