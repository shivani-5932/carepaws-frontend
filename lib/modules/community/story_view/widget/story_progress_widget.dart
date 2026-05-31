import 'package:flutter/material.dart';

class StoryProgressWidget extends StatelessWidget {

  final int count;
  final int currentIndex;
  final double progress;

  const StoryProgressWidget({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),

      child: Row(
        children: List.generate(count, (index) {

          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),

              height: 3,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),

                child: LinearProgressIndicator(

                  /// 🧠 LOGIC
                  value: _getProgressValue(index),

                  backgroundColor: Colors.white.withOpacity(0.3),

                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
            ),
          );

        }),
      ),
    );
  }

  /// 🔥 CLEAN LOGIC FUNCTION
  double _getProgressValue(int index) {

    if (index < currentIndex) {
      return 1; // completed
    }

    if (index == currentIndex) {
      return progress; // current running
    }

    return 0; // upcoming
  }
}