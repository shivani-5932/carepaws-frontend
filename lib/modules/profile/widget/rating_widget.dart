import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int maxRating;
  final Function(int)? onChanged;

  const RatingWidget({
    super.key,
    this.maxRating = 5,
    this.onChanged,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int selectedRating = 0;

  void updateRating(int index) {
    setState(() {
      selectedRating = index;
    });

    widget.onChanged?.call(selectedRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxRating, (index) {
        final currentIndex = index + 1;

        return GestureDetector(
          onTap: () => updateRating(currentIndex),
          child: Icon(
            currentIndex <= selectedRating
                ? Icons.star
                : Icons.star_border,
            color: Colors.orange,
            size: 30,
          ),
        );
      }),
    );
  }
}