import 'package:care_paws/modules/home/appointment_booking/booking_controller.dart';
import 'package:flutter/material.dart';

class ModeSelectorWidget extends StatelessWidget {

  final BookingController controller;
  final Function(String) onSelect;

  const ModeSelectorWidget({
    super.key,
    required this.controller,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    final modes = [
      "Call","Video Call","Message","Vet Visit","Clinic Visit"
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,

      children: modes.map((m){

        final selected = controller.model.selectedMode == m;

        return GestureDetector(
          onTap: () => onSelect(m),

          child: Container(
            height: 36,
            width: 108,

            decoration: BoxDecoration(
              color: selected ? const Color(0xFF987052) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFFECF82)),
            ),

            child: Center(
              child: Text(
                m,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );

      }).toList(),
    );
  }
}