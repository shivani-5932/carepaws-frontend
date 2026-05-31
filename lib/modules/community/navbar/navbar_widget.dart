import 'package:care_paws/modules/community/navbar/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();



    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xffF5EFE6),
        border: Border(
          top: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          /// HOME
          navItem(
            context,
            0,
            "assets/icons/home_outline.svg",
            "assets/icons/home_filled.svg",
            "Home",
          ),

          /// COMMUNITY
          navItem(
            context,
            1,
            "assets/icons/community_outline.svg",
            "assets/icons/community_filled.svg",
            "Community",
          ),

          /// 🔥 DYNAMIC (CLIPS / RESCUE)
          navItem(
            context,
            navController.isCommunitySelected ? 2 : 4,
            navController.isCommunitySelected
                ? "assets/icons/clip_outline.svg"
                : "assets/icons/rescue_outline.svg",
            navController.isCommunitySelected
                ? "assets/icons/clip_filled.svg"
                : "assets/icons/rescue_filled.svg",
            navController.isCommunitySelected ? "Clips" : "Rescue",
          ),

          /// 🔥 DYNAMIC (PET / PROFILE)
          navItem(
            context,
            navController.isCommunitySelected ? 3 : 5,
            navController.isCommunitySelected
                ? "assets/icons/pet_outline.svg"
                : "assets/icons/profile_outline.svg",
            navController.isCommunitySelected
                ? "assets/icons/pet_filled.svg"
                : "assets/icons/profile_filled.svg",
            navController.isCommunitySelected ? "Pet Profile" : "Profile",
          ),
        ],
      ),
    );
  }

  Widget navItem(BuildContext context,
      int index,
      String icon,
      String activeIcon,
      String label,) {
    final NavigationController controller = Get.find();

    return Obx(() {
      bool isSelected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.changeIndex(index);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? activeIcon : icon,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight:
                isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }
}