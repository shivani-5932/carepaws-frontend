import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class FilterLeftPanelWidget extends StatelessWidget {

  final List<String> categories;
  final String selectedCategory;
  final Map<String, List<String>> selectedMap;
  final Function(String) onSelect;

  const FilterLeftPanelWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.selectedMap,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      color: const Color(0x99EFE7DA),

      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index){

          final cat = categories[index];
          final isSelected = selectedCategory == cat;
          final count = selectedMap[cat]!.length;

          return GestureDetector(
            onTap: () => onSelect(cat),

            child: Stack(
              clipBehavior: Clip.none, // 🔥 IMPORTANT

              children: [

                /// MAIN TILE
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10), // height thodi badhao
                  color: isSelected
                      ? const Color(0xFFFECF82)
                      : Colors.transparent,

                  child: Text(cat),
                ),

                /// 🔥 TOP RIGHT BADGE (FLOATING PROPERLY)
                if(count > 0)
                  Positioned(
                    top: -4,   // 🔥 thoda upar nikalo
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white, // ✅ white
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xff6F4E37),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "$count",
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontSize: 10,
                          color: Color(0xff6F4E37),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}