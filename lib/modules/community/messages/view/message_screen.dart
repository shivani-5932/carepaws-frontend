
import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/messages/widget/chat_item_widget.dart';
import 'package:care_paws/modules/community/messages/widget/empty_chat_widget.dart';
import 'package:care_paws/modules/community/messages/widget/message_topbar_widget.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/app_routes.dart';
import '../controller/message_controller.dart';


class MessageScreen extends StatelessWidget {

  MessageScreen({super.key});

  final MessageController controller = MessageController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: Column(
            children: [

              const SizedBox(height: 10),

              const MessageTopbarWidget(),

              const SizedBox(height: 20),

              /// Search Bar
              SearchBarWidget(
                controller: searchController,
              ),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     border: Border.all(color: Colors.brown.shade200),
              //   ),
              //   child: const Row(
              //     children: [
              //       SizedBox(width: 12),
              //       Icon(Icons.search,color: Colors.grey),
              //       SizedBox(width: 8),
              //       Text(
              //         "Search",
              //         style: TextStyle(color: Colors.grey),
              //       )
              //     ],
              //   ),
              // ),

              const SizedBox(height: 20),

               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Chats",
                  style: AppTextStyles.h2.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Chat List / Empty Screen
              Expanded(

                child: controller.chats.isEmpty

                    ? const EmptyChatWidget()

                    : ListView.builder(
                  itemCount: controller.chats.length,
                  itemBuilder: (context,index){

                    return InkWell(
                      onTap: () {

                        Navigator.pushNamed(
                          context,
                          AppRoutes.dm,
                        );

                      },

                      child: ChatItemWidget(
                        chat: controller.chats[index],
                      ),
                    );

                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}