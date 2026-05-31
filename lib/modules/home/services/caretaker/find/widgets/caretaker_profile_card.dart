
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';

class CaretakerProfileCard extends StatelessWidget {
  final String name;
  final String experience;
  final String pets;
  final String availability;
  final String price;
  final String rating;
  final String image;

  const CaretakerProfileCard({
    super.key,
    required this.name,
    required this.experience,
    required this.pets,
    required this.availability,
    required this.price,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// 🔹 TOP INFO
          Row(
            children: [
              ProfileAvatarWidget(image: image,
              size: 64,),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                    ),
                    Text("Caretaker",
                        style: AppTextStyles.bodySmall),
                    Text("$experience EXPERIENCE",
                        style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600),)

                  ],
                ),
              ),

              Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.orange),
                  Text(rating,
                      style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),

          const SizedBox(height: 10),

          /// 🔹 DETAILS
          Text(pets,
              style: AppTextStyles.bodySmall.copyWith(color: Colors.black,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text("Availability : $availability",
              style: AppTextStyles.bodySmall),

          const SizedBox(height: 6),

          Text(price,
              style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.orange, fontWeight: FontWeight.bold)),

          const SizedBox(height: 4),

           Text("Pet Diet is not included in the charges",
              style: AppTextStyles.bodySmall),

          const SizedBox(height: 12),

          /// 🔹 BUTTON
          PrimaryButton(text:"Contact",
          onTap: (){

          },)

        ],
      ),
    );
  }
}