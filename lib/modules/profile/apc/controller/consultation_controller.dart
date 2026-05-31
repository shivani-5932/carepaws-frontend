import 'package:care_paws/modules/profile/apc/dummy_data/dummy_consultations.dart';
import 'package:care_paws/modules/profile/apc/model/profile_consultation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileConsultationController extends GetxController {
  var consultations = <ProfileConsultationModel>[].obs;

  @override
  void onInit() {
    loadConsultations();
    super.onInit();
  }

  void loadConsultations() {
    consultations.value = dummyConsultations;
  }
}