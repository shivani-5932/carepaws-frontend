import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/contrast_button.dart';
import 'package:care_paws/modules/community/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showConfirmSheet({
  required String title,
  required String confirmText,
  required VoidCallback onConfirm,
}) {


  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFDFCFA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          /// DRAG HANDLE
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 14),
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              /// CANCEL
              Expanded(
                child:PrimaryButton(
                  text: "Cancel",
                  onTap: () => Get.back(),
                ),
              ),

              const SizedBox(width: 10),

              /// CONFIRM
              Expanded(
                child: ContrastButton(
                  text: confirmText == "Delete"? "Delete": "Log out",
                  onTap: onConfirm,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}