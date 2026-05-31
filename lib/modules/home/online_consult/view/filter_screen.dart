import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/home/online_consult/widget/filter/filter_bottom_bar_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/filter/filter_left_panel_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/filter/filter_right_panel_widget.dart';
import 'package:flutter/material.dart';
import '../controller/online_consult_controller.dart';

class FilterScreen extends StatefulWidget {

  final OnlineConsultController controller;

  const FilterScreen({super.key, required this.controller});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  String selectedCategory = "Experience";

  final categories = [
    "Experience",
    "Availability",
    "Price",
    "Gender",
    "Language",
    "Facility",
    "Speciality",
  ];

  Map<String, List<String>> options = {

    "Experience": ["0-5", "5-6", "6-11", "11-16", "16+"],

    "Availability": ["Now", "Today", "Tomorrow", "Next 3 days"],

    "Price": ["100-500", "500-1000", "1000+"],

    "Gender": ["Female", "Male"],

    "Language": ["English", "Hindi", "Punjabi", "Haryanvi", "Urdu"],

    "Facility": ["Call", "Video Call", "Chat", "Visit", "Clinic Visit"],

    "Speciality": [
      "Cardiology",
      "ENT",
      "General Vet",
      "Dentistry",
      "Exotic Pet",
      "Neurology",
      "Nutritionist",
      "Physiotherapy",
      "Vaccination"
    ],
  };

  /// 🔥 TOGGLE
  void toggleItem(String value){
    widget.controller.toggleFilter(selectedCategory, value);
    setState(() {});
  }

  /// 🔥 CLEAR
  void clearAll(){
    widget.controller.clearAllFilters();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final selectedList =
    widget.controller.filterModel.selected[selectedCategory]!;

    return Scaffold(

      appBar: AppBar(
        title: Text(
            "Filter",
        style: AppTextStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w600
        ),
        ),
        actions: [
          TextButton(
            onPressed: clearAll,
            child:  Text("Clear All",
              style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                color: Colors.orange
              ),
            ),
          )
        ],
      ),

      body: Row(
        children: [

          /// LEFT PANEL
          FilterLeftPanelWidget(
            categories: categories,
            selectedCategory: selectedCategory,
            selectedMap: widget.controller.filterModel.selected,
            onSelect: (cat){
              setState(() {
                selectedCategory = cat;
              });
            },
          ),

          /// RIGHT PANEL
          Expanded(
            child: FilterRightPanelWidget(
              selectedCategory: selectedCategory,
              options: options[selectedCategory]!,
              selectedList: selectedList,
              onToggle: toggleItem,
            ),
          ),
        ],
      ),

      /// 🔥 BOTTOM BAR
      bottomNavigationBar: FilterBottomBarWidget(
        onClear: clearAll,
        onApply: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}