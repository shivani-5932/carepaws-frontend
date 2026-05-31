import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import '../controller/online_consult_controller.dart';

void showSortBottomSheet(
    BuildContext context,
    OnlineConsultController controller,
    VoidCallback refresh,
    ) {

  final options = [
    "Relevance",
    "Near By",
    "Rating",
    "Availability",
    "Years of Experience",
    "Price - Low to High",
    "Price - High to Low",
  ];

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {

      return StatefulBuilder(
        builder: (context, setState){

          return Padding(
            padding: const EdgeInsets.all(16),

            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// TOP HANDLE
                  Container(
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                   Text(
                    "Sort By",
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// OPTIONS
                  ...options.map((option){

                    final isSelected =
                        controller.selectedSort == option;

                    return ListTile(

                      leading: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: isSelected
                            ? Colors.orange
                            : Colors.grey,
                      ),

                      title: Text(option),

                      onTap: (){
                        setState(() {
                          controller.setSort(option);
                        });

                        refresh(); // 🔥 refresh main screen
                        Navigator.pop(context);
                      },
                    );

                  }).toList(),

                ],
              ),
            ),
          );
        },
      );
    },
  );
}