import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var notificationsEnabled = true.obs;

  void toggleNotification(bool value) {
    notificationsEnabled.value = value;
  }

  void deleteAccount() {
    print("Account Deleted");
  }

  void logout() {
    print("Logged out");
  }
}