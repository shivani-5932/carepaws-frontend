import 'package:care_paws/modules/community/widget/soon_widget.dart';
import 'package:flutter/material.dart';

class PetEventsScreen extends StatelessWidget {
  const PetEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SoonWidget(
      title: "Pet Events",
      imagePath: "assets/images/pet_events_soon.png",
    );
  }
}