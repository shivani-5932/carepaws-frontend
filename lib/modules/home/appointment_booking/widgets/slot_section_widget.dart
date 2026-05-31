import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/appointment_booking/booking_controller.dart';
import 'package:care_paws/modules/home/appointment_booking/widgets/slot-chip_widget.dart';
import 'package:flutter/material.dart';

class SlotSectionWidget extends StatefulWidget {
  final String title;
  final List<String> slots;
  final BookingController controller;
  final Function(String) onSelect;

  const SlotSectionWidget({
    super.key,
    required this.title,
    required this.slots,
    required this.controller,
    required this.onSelect,
  });

  @override
  State<SlotSectionWidget> createState() => _SlotSectionWidgetState();
}

class _SlotSectionWidgetState extends State<SlotSectionWidget> {

  bool showAll = false;

  @override
  Widget build(BuildContext context) {

    final displaySlots =
    showAll ? widget.slots : widget.slots.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: AppTextStyles.h2.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "${widget.slots.length} SLOTS",
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black38,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: displaySlots.map((slot) {
            return SizedBox(
              width: 108,
              height: 36,
              child: SlotChipWidget(
                  time: slot,
                  selected: widget.controller.model.selectedSlot == slot,
                  onTap: () => widget.onSelect(slot),
                ),
            );
          }).toList(),
        ),

        const SizedBox(height: 10),

        GestureDetector(
          onTap: () {
            setState(() {
              showAll = !showAll;
            });
          },
          child: Center(
            child: Text(
              showAll ? "View Less ↑" : "View More ↓",
              style: AppTextStyles.bodyMedium.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}