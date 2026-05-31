import 'package:care_paws/core/navigation/app_navigator.dart';
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/profile/controller/profile_controller.dart';
import 'package:care_paws/modules/profile/widget/rating_widget.dart';
import 'package:care_paws/modules/profile/widget/role_switch_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),
      appBar: AppBar(
        title: const Text("Doctor Profile"),
        backgroundColor: const Color(0xFFFDFCFA),
        elevation: 0,
      ),
      body: Obx(() {
        final user = controller.user.value;
        final options = controller.getOptions(user.currentRole);

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// Profile Image
              Stack(
                children: [
                  ProfileAvatarWidget(
                      image: "assets/images/doctor.png",
                      size:90
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 16),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 10),

              Text(
                user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              Text(
                user.email,
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 5),

              InkWell(
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.orange),
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/editProfile');
                },
              ),

              const SizedBox(height: 20),

              /// ROLE SWITCHER
              if (user.isDoctor || user.isRescuer)
                RoleSwitcher(
                  user: user,
                  onSwitch: controller.switchRole,
                ),

              const SizedBox(height: 20),

              /// OPTIONS LIST
              ...options.map(
                    (e) => ListTile(

                  /// LEFT SVG ICON
                  leading: SvgPicture.asset(
                    e.icon,
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff6B4F3A),
                      BlendMode.srcIn,
                    ),
                  ),

                  /// TEXT STYLE FIX
                  title: Text(
                    e.title,
                    style: AppTextStyles.bodyMedium,
                  ),

                  /// RIGHT ARROW SVG
                  trailing: SvgPicture.asset(
                    "assets/icons/arrow_right.svg",
                    height: 24,
                    width: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.srcIn,
                    ),
                  ),

                  onTap: () =>
                      AppNavigator.handleNavigation(e.title),

                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Rate Your experience",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 8),

              /// RATING
              RatingWidget(
                onChanged: (rating) {
                  print("Selected rating: $rating");
                },
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}