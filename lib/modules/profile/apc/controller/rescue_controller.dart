import 'package:care_paws/modules/profile/apc/dummy_data/dummy_rescues.dart';
import 'package:care_paws/modules/profile/apc/model/profile_rescue_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileRescueController extends GetxController {
  var rescues = <ProfileRescueModel>[].obs;

  @override
  void onInit() {
    loadRescues();
    super.onInit();
  }

  void loadRescues() {
    rescues.value = dummyRescues;
  }
}