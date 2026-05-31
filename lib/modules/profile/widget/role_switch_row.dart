import 'package:care_paws/modules/auth/model/user_model.dart';
import 'package:care_paws/modules/profile/model/profile_user_model.dart';
import 'package:care_paws/modules/profile/widget/role_switch_button.dart';
import 'package:flutter/material.dart';

class RoleSwitcher extends StatelessWidget {
  final ProfileUserModel user;
  final Function(ProfileUserRole) onSwitch;

  const RoleSwitcher({
    super.key,
    required this.user,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    /// USER (always)
    buttons.add(
      RoleButton(
        title: "User",
        isSelected: user.currentRole == ProfileUserRole.user,
        onTap: () => onSwitch(ProfileUserRole.user),
      ),
    );

    if (user.isDoctor) {
      buttons.add(const SizedBox(width: 10));
      buttons.add(
        RoleButton(
          title: "Doctor",
          isSelected: user.currentRole == ProfileUserRole.doctor,
          onTap: () => onSwitch(ProfileUserRole.doctor),
        ),
      );
    }

    if (user.isRescuer) {
      buttons.add(const SizedBox(width: 10));
      buttons.add(
        RoleButton(
          title: "Rescuer",
          isSelected: user.currentRole == ProfileUserRole.rescuer,
          onTap: () => onSwitch(ProfileUserRole.rescuer),
        ),
      );
    }

    return Row(children: buttons);
  }
}