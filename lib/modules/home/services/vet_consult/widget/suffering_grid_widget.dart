import 'package:flutter/material.dart';

class SufferingGridWidget extends StatelessWidget {

  final List<String> data;

  const SufferingGridWidget({super.key, required this.data});

  int getCrossAxisCount(double width) {
    if (width < 600) return 3;
    if (width < 900) return 4;
    return 5;
  }

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final crossAxisCount = getCrossAxisCount(constraints.maxWidth);

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: data.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.5, // 🔥 pill shape
          ),

          itemBuilder: (context, index) {

            return Container(
              alignment: Alignment.center,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.brown),
              ),

              child: Text(
                data[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
        );
      },
    );
  }
}