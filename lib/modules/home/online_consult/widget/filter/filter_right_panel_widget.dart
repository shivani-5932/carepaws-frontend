import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/filter/filter_option_chip.dart';
import 'package:flutter/material.dart';

class FilterRightPanelWidget extends StatelessWidget {

  final String selectedCategory;
  final List<String> options;
  final List<String> selectedList;
  final Function(String) onToggle;

  const FilterRightPanelWidget({
    super.key,
    required this.selectedCategory,
    required this.options,
    required this.selectedList,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(12),

      child: ListView(
        children: [

          /// Special search
          if(selectedCategory == "Speciality")
            SearchBarWidget(
              controller: TextEditingController(),
            ),

          const SizedBox(height: 10),

          Column(
            children: options.map((item){

              final isSelected = selectedList.contains(item);

              return CheckboxListTile(
                value: isSelected,
                onChanged: (_){
                  onToggle(item);
                },
                title: Text(
                  item,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ) ,),

                controlAffinity: ListTileControlAffinity.leading,
                activeColor: const Color(0xFF987052),

                contentPadding: EdgeInsets.zero,
              );

            }).toList(),
          )
        ],
      ),
    );
  }
}