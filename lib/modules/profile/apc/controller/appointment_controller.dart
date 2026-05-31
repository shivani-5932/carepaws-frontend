
import 'package:care_paws/modules/profile/apc/dummy_data/dummy_appointments.dart';
import 'package:care_paws/modules/profile/apc/model/profile_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAppointmentController extends GetxController {
  var appointments = <ProfileAppointmentModel>[].obs;

  @override
  void onInit() {
    loadAppointments();
    super.onInit();
  }

  void loadAppointments() {
    // Future: API call here
    appointments.value = dummyAppointments;
  }
}