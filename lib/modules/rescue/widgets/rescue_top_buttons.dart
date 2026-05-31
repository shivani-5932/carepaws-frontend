import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/rescue/view/add_rescue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RescueTopButtons extends StatelessWidget {
  const RescueTopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [

          /// 🔹 Add Rescue Button
             PrimaryButton(
              text: "Add New Rescue →",
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddRescueScreen(),
                ),
              );
            },
             ),


          const SizedBox(height: 18),

          /// 🔹 Join Text
           Text(
            "Join Rescue Community on Following",
            style: AppTextStyles.h2.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          /// 🔹 Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              socialBox(
                  "assets/icons/whatsapp.png"),
              const SizedBox(width: 20),
              socialBox("assets/icons/logo.png"),
            ],
          ),
        ],
      );
  }

  Widget socialBox(String icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(icon, height: 60, width: 60,),
    );
  }
}