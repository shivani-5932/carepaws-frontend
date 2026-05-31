import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/pet_profile/controller/pet_profile_controller.dart';
import 'package:care_paws/modules/community/pet_profile/widget/highlights_widget.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_avatar_section.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_cover_widget.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_grid_widget.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_header_widget.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_info_widget.dart';
import 'package:care_paws/modules/community/pet_profile/widget/pet_profile_tabs_widget.dart';
import 'package:flutter/material.dart';


class PetProfileScreen extends StatefulWidget {
  const PetProfileScreen({super.key});

  @override
  State<PetProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<PetProfileScreen> {

  final PetProfileController controller = PetProfileController();

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(   // ✅ IMPORTANT

          child: Column(
            children: [

              const PetProfileHeaderWidget(),

              /// 🔜 yaha ProfileInfo + Highlights aayega


              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,

                children: [

                  const PetProfileCoverWidget(), // 🔥 background image

                  const Positioned(
                    bottom: -45,
                    child: PetProfileAvatarSection(), // 🔥 avatar overlap
                  ),

                ],
              ),


              const PetProfileInfoWidget(),

              const PetProfileHighlightsWidget(),

              PetProfileTabsWidget(
                selectedIndex: selectedTab,
                onTap: (index){
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),

              buildContent(), // ❌ Expanded hata diya

            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }

  Widget buildContent(){

    if(selectedTab == 0){
      return PetProfileGridWidget(items: controller.posts);
    }

    if(selectedTab == 1){
      return PetProfileGridWidget(items: controller.clips);
    }

    return PetProfileGridWidget(items: controller.mentions);
  }
}