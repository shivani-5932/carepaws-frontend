import 'package:care_paws/modules/home/appointment_booking/date_picker/view/custom_date_picker_screen.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String hintText;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const DatePickerField({
    super.key,
    required this.hintText,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        final pickedDate =
        await showModalBottomSheet<DateTime>(
          context: context,
          isScrollControlled: true,
          builder: (_) => const CustomDatePicker(),
        );

        if (pickedDate != null) {
          onDateSelected(pickedDate);
        }
      },

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

          children: [

            /// Text (Same size as InputField)
            Text(
              selectedDate == null
                  ? hintText
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

              style: AppTextStyles.bodyMedium.copyWith(
                color: selectedDate == null
                    ? Colors.grey.shade500
                    : Colors.black,
              ),
            ),

            /// Calendar Icon
            const Icon(
              Icons.calendar_today,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}