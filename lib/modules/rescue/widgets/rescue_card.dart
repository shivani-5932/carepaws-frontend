import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/chat/view/chat_screen.dart';
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:care_paws/modules/rescue/controller/resue_controller.dart';
import 'package:care_paws/modules/rescue/model/rescue_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RescueCard extends StatelessWidget {
  final RescueModel rescue;
  final int index;

  const RescueCard({
    super.key,
    required this.rescue,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RescueController>(context, listen: false);

    return Container(
      height: 216,
      width: 358,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0x80EFE7DACC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🐶 IMAGE + TEXT
            Row(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(10),
                //   child: Image.network(
                //     "https://images.unsplash.com/photo-1583337130417-3346a1be7dee",
                //     height: 60,
                //     width: 60,
                //     fit: BoxFit.cover,
                //   ),
                // ),

                ProfileAvatarWidget(
                    image: "assets/images/dog1.png",
                    size: 64,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location: ${rescue.location}",
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                      ),),
                      Text("Problem: ${rescue.animal} (${rescue.problem})",
                        style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),),
                      Text("Contact: ${rescue.phone}",
                        style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                          color: Colors.black
                        ),),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔴 TAGS
            Row(
              children: [
                Container(
                  height: 24,
                  width: 72,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Text("Urgency",
                    style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      color: Colors.red,
                      fontSize: 10,
                    ),),
                ),

                const SizedBox(width: 10),

                if (rescue.isAdded)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Text(
                      "Added",
                      style: AppTextStyles.bodyMedium.copyWith(color: Colors.green),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔥 HELP BUTTON
               ContrastButton(
                  text: "Help",
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(),
                      ),
                    );
                  } ,
               )
          ],
        ),
      ),
    );
  }
}