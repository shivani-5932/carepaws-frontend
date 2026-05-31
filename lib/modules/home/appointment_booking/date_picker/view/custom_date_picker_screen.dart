import 'package:care_paws/modules/home/appointment_booking/date_picker/controller/date_picker_controller.dart';
import 'package:care_paws/modules/home/appointment_booking/date_picker/widgets/continue_button_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/date_picker/widgets/date_grid_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/date_picker/widgets/date_header_widget.dart';
import 'package:care_paws/modules/home/appointment_booking/date_picker/widgets/week_days_widget.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {

  final controller = DatePickerController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [

          const Text("Select Birth Date"),

          DateHeaderWidget(
            title: "${controller.model.current.month}/${controller.model.current.year}",
            onPrev: (){
              setState(() => controller.prevMonth());
            },
            onNext: (){
              setState(() => controller.nextMonth());
            },
          ),

          const WeekDaysWidget(),

          DateGridWidget(
            days: controller.getDays(),
            current: controller.model.current,
            selected: controller.model.selected,
            onSelect: (d){
              setState(() => controller.selectDate(d));
            },
          ),

          const SizedBox(height: 16),

          ContinueButtonWidget(
            onTap: (){
              Navigator.pop(context, controller.model.selected);
            },
          )
        ],
      ),
    );
  }
}