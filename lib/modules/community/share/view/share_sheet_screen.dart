import 'package:care_paws/modules/community/share/widget/share_action_bar_widget.dart';
import 'package:care_paws/modules/community/share/widget/share_grid_widget.dart';
import 'package:care_paws/modules/community/share/widget/share_send_bar_widget.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import '../controller/share_controller.dart';

class ShareSheetScreen extends StatefulWidget {
  const ShareSheetScreen({super.key});

  @override
  State<ShareSheetScreen> createState() => _ShareSheetScreenState();
}

class _ShareSheetScreenState extends State<ShareSheetScreen> {

  final ShareController controller = ShareController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(

      height: MediaQuery.of(context).size.height * 0.7, // 🔥 IMPORTANT

      padding: const EdgeInsets.all(16),

      child: Column(
        children: [

          /// SEARCH
          SearchBarWidget(
            controller: searchController,
          ),

          const SizedBox(height: 20),

          /// GRID (SCROLLABLE 🔥)
          Expanded(
            child: ShareGridWidget(
              users: controller.users,
              onSelect: (index) {

                setState(() {
                  controller.toggleSelection(index);
                });

              },
            ),
          ),

          /// SEND BAR (FIXED)
          controller.hasSelection()
              ? ShareSendBarWidget(
            show: true,
          )
              : ShareActionBarWidget(),

        ],
      ),
    );
  }
}