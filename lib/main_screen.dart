import 'package:care_paws/modules/community/clips/clips_screen.dart';
import 'package:care_paws/modules/community/homepage/homepage_screen.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/navbar/navigation_controller.dart';
import 'package:care_paws/modules/community/pet_profile/view/pet_profile_screen.dart';
import 'package:care_paws/modules/home/view/home_screen.dart';
import 'package:care_paws/modules/profile/apc/view/rescue_screen.dart';
import 'package:care_paws/modules/profile/view/profile_screen.dart';
import 'package:care_paws/modules/rescue/rescue_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavigationController navController =
  Get.find<NavigationController>();


  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CommunityHomePage();
      case 2:
        return ClipsScreen();
      case 3:
        return PetProfileScreen();
      case 4:
        return RescueScreen();
      case 5:
        return ProfileScreen();
      default:
        return CommunityHomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("CURRENT INDEX: ${navController.selectedIndex.value}");
    return Obx(() {   // 🔥 THIS IS THE FIX
      return Scaffold(
        body: getScreen(navController.selectedIndex.value),

      );
    });
  }
}