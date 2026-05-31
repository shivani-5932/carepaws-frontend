import 'package:care_paws/modules/community/notifications/widget/notification_tile_widget.dart';
import 'package:flutter/material.dart';
import '../controller/notification_controller.dart';

class NotificationScreen extends StatelessWidget {

  NotificationScreen({super.key});

  final NotificationController controller = NotificationController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: false,
      ),

      body: ListView.builder(

        itemCount: controller.notifications.length,

        itemBuilder: (context, index){

          return NotificationTileWidget(
            notification: controller.notifications[index],
          );

        },
      ),
    );
  }
}