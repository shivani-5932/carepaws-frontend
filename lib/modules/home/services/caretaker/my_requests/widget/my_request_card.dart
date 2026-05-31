import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';

class MyRequestCard extends StatelessWidget {
  final bool isSelected;
  final bool selectionMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool isCaretaker; // 🔥 key


  const MyRequestCard({
    super.key,
    required this.isSelected,
    required this.selectionMode,
    required this.onTap,
    required this.onLongPress,
    this.isCaretaker = false, // default user
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5EDE4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFD6B08C)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 TOP ROW
            Row(
              children: [

                /// PET IMAGE
               Row(
                 children: [
                   ProfileAvatarWidget(image: "assets/images/cat1.png",
                   size: 145,),

                   const SizedBox(width: 12),

                   /// DETAILS

                      Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Pet Name : Bruno (Dog)",
                           style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                               color: Colors.black),),

                         SizedBox(height: 16,),

                         Text("Breed : German Shepherd",
                           style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                               color: Colors.black),),

                         SizedBox(height: 16,),

                         Text("Age : 12 months",
                           style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                               color: Colors.black),),
                         SizedBox(height: 16,),

                         Text("Care Duration : 5 days",
                           style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                               color: Colors.black),),

                         SizedBox(height: 16,),

                         Text("Location : Sharifpura, Asr",
                           style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                               color: Colors.black),),


                       ],
                     ),

                 ],
               ),



                /// 🔹 SELECT BOX (ROUNDED SQUARE)
                if (selectionMode)
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isSelected
                            ? Colors.brown
                            : Colors.black45,
                      ),
                      color: isSelected
                          ? Colors.brown
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check,
                        size: 16, color: Colors.white)
                        : null,
                  )
              ],
            ),

            const SizedBox(height: 10),

             Text("Rs 400/day",
              style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600,
                  color: Colors.orange),
                ),

            const SizedBox(height: 12),

            /// BUTTON
            ContrastButton(
                text: "View Details →",
            onTap: (){
                  Navigator.pushNamed(context, '/viewDetails');
            },
            )

          ],
        ),
      ),
    );
  }
}