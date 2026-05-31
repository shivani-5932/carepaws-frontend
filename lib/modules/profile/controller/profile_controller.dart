import 'package:care_paws/modules/profile/model/profile_option_model.dart';
import 'package:care_paws/modules/profile/model/profile_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var user = ProfileUserModel(
    name: "Ashdeep",
    email: "ash@email.com",
    imageUrl: "https://i.pravatar.cc/150?img=3",
    isDoctor: true,
    isRescuer: true,
    currentRole: ProfileUserRole.user,
  ).obs;

  void switchRole(ProfileUserRole role) {
    user.value = user.value.copyWith(currentRole: role);
  }

  /// dynamic menu logic
  List<ProfileOption> getOptions(ProfileUserRole role) {
    switch (role) {
      case ProfileUserRole.user:
        return [
          ProfileOption("Settings", "assets/icons/settings.svg"),
          ProfileOption("Payments", "assets/icons/payments.svg"),
          ProfileOption("My Appointments", "assets/icons/my_appointments.svg"),
          ProfileOption("My Rescue", "assets/icons/my_rescue.svg"),
          ProfileOption("Help & Support", "assets/icons/help.svg"),
          ProfileOption("Terms and Conditions", "assets/icons/terms.svg"),
          ProfileOption("About Us", "assets/icons/about_us.svg"),
        ];

      case ProfileUserRole.doctor:
        return [
          ProfileOption("Settings", "assets/icons/settings.svg"),
          ProfileOption("Consultation", "assets/icons/my_appointments.svg"),
          ProfileOption("My Rescue", "assets/icons/my_rescue.svg"),
          ProfileOption("Help & Support", "assets/icons/help.svg"),
          ProfileOption("Terms and Conditions", "assets/icons/terms.svg"),
          ProfileOption("About Us", "assets/icons/about_us.svg"),
        ];

      case ProfileUserRole.rescuer:
        return [
          ProfileOption("Settings", "assets/icons/settings.svg"),
          ProfileOption("My Appointments", "assets/icons/my_appointments.svg"),
          ProfileOption("My Rescue", "assets/icons/my_rescue.svg"),
          ProfileOption("Help & Support", "assets/icons/help.svg"),
          ProfileOption("Terms and Conditions", "assets/icons/terms.svg"),
          ProfileOption("About Us", "assets/icons/about_us.svg"),
        ];
    }
  }
}