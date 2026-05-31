import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/features/services/service_type.dart';
import 'package:care_paws/modules/home/common_widgets/common_card_widget.dart';
import 'package:flutter/material.dart';

class ServiceCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final ServiceType type;

  const ServiceCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.type,
  });

  void _handleTap(BuildContext context) {
    AppNavigator.navigateToService(context, type);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _handleTap(context),

      child: CommonCardWidget(
        image: image,
        title: title,
        height: 208,

        // 👇 optional customizations if needed
        showBorder: false,
        isSelected: false,
      ),
    );
  }
}