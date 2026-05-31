import 'package:care_paws/modules/community/widget/soon_widget.dart';
import 'package:flutter/material.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoonWidget(
      title: "Pharmacy",
      imagePath: "assets/images/pharmacy_soon.png",
    );
  }
}