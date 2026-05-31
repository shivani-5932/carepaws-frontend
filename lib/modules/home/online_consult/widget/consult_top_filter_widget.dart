import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/online_consult/controller/online_consult_controller.dart';
import 'package:care_paws/modules/home/online_consult/view/filter_screen.dart';
import 'package:care_paws/modules/home/online_consult/widget/filter_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:care_paws/modules/home/online_consult/widget/sort_bottom_sheet.dart';

class ConsultTopFilterWidget extends StatelessWidget {

  final OnlineConsultController controller;
  final Function(String, String) onToggle;
  final Function(String) onTypeChange;

  const ConsultTopFilterWidget({
    super.key,
    required this.controller,
    required this.onToggle,
    required this.onTypeChange,
  });

  @override
  Widget build(BuildContext context) {

    final isFilterApplied = controller.filterModel.isAnyFilterApplied;
    final isSortApplied = controller.selectedSort != "Relevance";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🔥 TOP ROW
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            /// 🔥 CONSULTANT DROPDOWN
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xff6F4E37),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 36,
              child: DropdownButton<String>(
                value: controller.selectedType,
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),

                items: const [
                  DropdownMenuItem(
                    value: "online",
                    child: Text("Online Consultant"),
                  ),
                  DropdownMenuItem(
                    value: "physical",
                    child: Text("Physical Consultant"),
                  ),
                  DropdownMenuItem(
                    value: "both",
                    child: Text("Both"),
                  ),
                ],

                onChanged: (value){
                  if(value != null){
                    onTypeChange(value);
                  }
                },

                selectedItemBuilder: (context) {
                  return [
                    "Online Consultant",
                    "Physical Consultant",
                    "Both"
                  ].map((text) {
                    return Center(
                      child: Text(
                        text,
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ),

            /// LOCATION (same as before)
            Row(
              children: [
                Image.asset("assets/icons/location.png",
                height: 24,
                width: 24,),
                SizedBox(width: 4),
                Text("Sharifpura, Asr",
                style: AppTextStyles.bodySmall,),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),

         SizedBox(height: 10),

        /// 🔥 SORT + FILTER BUTTONS
        Row(
          children: [

            GestureDetector(
              onTap: (){
                showSortBottomSheet(
                  context,
                  controller,
                      () => (context as Element).markNeedsBuild(),
                );
              },
              child: _simpleButton("Sort By", isSortApplied),
            ),

            const SizedBox(width: 8),

            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FilterScreen(controller: controller),
                  ),
                ).then((_) {
                  (context as Element).markNeedsBuild();
                });
              },
              child: _simpleButton("Filter", isFilterApplied),
            ),
          ],
        ),

        const SizedBox(height: 10),

        /// 🔥 SELECTED FILTER CAPSULES
        if (controller.filterModel.isAnyFilterApplied)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: controller.filterModel.selected.entries
                .expand((entry) {
              return entry.value.map((f) {
                return FilterChipWidget(
                  text: f,
                  selected: true,
                  onTap: () {
                    onToggle(entry.key, f);
                  },
                );
              });
            }).toList(),
          ),
      ],
    );
  }

  Widget _simpleButton(String text, bool isActive){
    return Container(
      height: 36,
      width: 108,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff6F4E37) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff6F4E37)),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : const Color(0xff6F4E37),
          ),
        ),
      ),
    );
  }
}