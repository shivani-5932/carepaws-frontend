import 'package:care_paws/modules/home/appointment_booking/date_picker/model/date_picker_model.dart';
import 'package:flutter/material.dart';

class DatePickerController {

  final model = DatePickerModel();

  void nextMonth(){
    model.current = DateTime(
      model.current.year,
      model.current.month + 1,
    );
  }

  void prevMonth(){
    model.current = DateTime(
      model.current.year,
      model.current.month - 1,
    );
  }

  void selectDate(int day){
    model.selected = DateTime(
      model.current.year,
      model.current.month,
      day,
    );
  }

  List<int> getDays(){

    final firstDay = DateTime(model.current.year, model.current.month, 1);
    final lastDay = DateTime(model.current.year, model.current.month + 1, 0);

    List<int> days = [];

    for(int i = 0; i < firstDay.weekday % 7; i++){
      days.add(0);
    }

    for(int i = 1; i <= lastDay.day; i++){
      days.add(i);
    }

    return days;
  }
}