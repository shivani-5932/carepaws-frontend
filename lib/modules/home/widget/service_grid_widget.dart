import 'package:care_paws/features/services/service_type.dart';
import 'package:care_paws/modules/home/common_widgets/common_card_widget.dart';
import 'package:flutter/material.dart';
import 'service_card_widget.dart';

class ServicesGridWidget extends StatelessWidget {
  const ServicesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final services = [

      {"img": "assets/images/service/vet.png", "title": "Vet Consultation", "type": ServiceType.vet},
      {"img": "assets/images/service/record.png", "title": "Pet Record", "type": ServiceType.record},
      {"img": "assets/images/service/breed.png", "title": "Care-Taker Section", "type": ServiceType.caretaker},
      {"img": "assets/images/service/pharmacy.png", "title": "Pharmacy", "type": ServiceType.pharmacy},
      {"img": "assets/images/service/groom.png", "title": "Grooming", "type": ServiceType.grooming},
      {"img": "assets/images/service/events.png", "title": "Pet Events", "type": ServiceType.events},

    ];

    return GridView.builder(

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: services.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 14, // was 14
        crossAxisSpacing: 14,
        childAspectRatio: 0.72, // better proportion
      ),

      itemBuilder: (context, index){

        final item = services[index];

        return ServiceCardWidget(
          image: item["img"]as String,
          title: item["title"] as String,
          type: item["type"] as ServiceType,
        );
      },
    );
  }
}