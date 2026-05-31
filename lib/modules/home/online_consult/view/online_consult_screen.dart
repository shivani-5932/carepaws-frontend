import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:care_paws/modules/home/online_consult/controller/online_consult_controller.dart';
import 'package:care_paws/modules/home/online_consult/widget/consult_top_filter_widget.dart';
import 'package:care_paws/modules/home/online_consult/widget/doctor_card_widget.dart';
import 'package:flutter/material.dart';

class OnlineConsultScreen extends StatefulWidget {

  final String initialType;

  const OnlineConsultScreen({
    super.key,
    this.initialType="online",
  });



  @override
  State<OnlineConsultScreen> createState() => _OnlineConsultScreenState();
}

class _OnlineConsultScreenState extends State<OnlineConsultScreen> {

  final controller = OnlineConsultController();

  void toggleFilter(String category, String value){
    setState(() {
      controller.toggleFilter(category, value);
    });
  }

  @override
  void initState() {
    super.initState();

    controller.selectedType = widget.initialType;
  }

  /// 🔥 TYPE CHANGE (online / physical / both)
  void changeType(String type){
    setState(() {
      controller.selectedType = type;
    });
  }

  @override
  Widget build(BuildContext context) {

    /// 🔥 IMPORTANT (yaha hona chahiye)
    final doctors = controller.applySorting(
        controller.getFilteredDoctors()
    );

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(

          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(12),

                child: Column(
                  children: [

                    /// SEARCH
                    SearchBarWidget(
                      controller: TextEditingController(),
                    ),

                    const SizedBox(height: 10),

                    /// 🔥 FILTER SECTION
                    ConsultTopFilterWidget(
                      controller: controller,
                      onToggle: toggleFilter,
                      onTypeChange: changeType, // 🔥 FIXED
                    ),

                  ],
                ),
              ),

              /// 🔥 LISTVIEW
              Expanded(
                child: ListView.builder(

                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  itemCount: doctors.length,

                  itemBuilder: (context, index){
                    return DoctorCardWidget(
                      data: doctors[index],
                      showBookButton: true,
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}