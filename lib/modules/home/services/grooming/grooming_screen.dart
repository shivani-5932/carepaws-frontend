import 'package:care_paws/modules/community/widget/soon_widget.dart';
import 'package:flutter/material.dart';

class GroomingScreen extends StatelessWidget {
  const GroomingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoonWidget(
      title: "Grooming",
      imagePath: "assets/images/grooming_soon.png",
    );
  }
}