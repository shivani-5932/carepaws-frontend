import 'package:flutter/material.dart';

class DateGridWidget extends StatelessWidget {

  final List<int> days;
  final DateTime current;
  final DateTime? selected;
  final Function(int) onSelect;

  const DateGridWidget({
    super.key,
    required this.days,
    required this.current,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: days.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),

      itemBuilder: (_, i){

        final day = days[i];

        if(day == 0) return const SizedBox();

        final isSelected = selected != null &&
            selected!.day == day &&
            selected!.month == current.month &&
            selected!.year == current.year;

        return GestureDetector(
          onTap: () => onSelect(day),

          child: Container(
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: isSelected ? const Color(0xff6F4E37) : null,
              shape: BoxShape.circle,
            ),

            child: Text(
              "$day",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}