import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/rescue/controller/resue_controller.dart';
import 'package:care_paws/modules/rescue/view/add_rescue_screen.dart';
import 'package:care_paws/modules/rescue/widgets/rescue_header.dart';
import 'package:care_paws/modules/rescue/widgets/rescue_top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/rescue_card.dart';

class RescueScreen extends StatelessWidget {
  const RescueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RescueController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFDFCFA),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              const RescueHeader(),

              SizedBox(height: 10,),

              const RescueTopButtons(),

              SizedBox(height: 10,),

              /// 🔥 FIXED LIST
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.rescues.length,
                  itemBuilder: (context, index) {
                    final rescue = controller.rescues[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: RescueCard(
                        rescue: rescue,
                        index: index, // 🔥 IMPORTANT
                      ),
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