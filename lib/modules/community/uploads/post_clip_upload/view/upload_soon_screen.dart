import 'package:care_paws/modules/community/uploads/post_clip_upload/widget/upload_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';


class UploadSoonScreen extends StatelessWidget {
  const UploadSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            const UploadHeaderWidget(),

            /// CONTENT
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  /// TEXT
                  const Text(
                    "Soon",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6F4E37),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  /// IMAGE
                  Image.asset(
                    "assets/images/paw.png",
                    height: height * 0.35,
                    fit: BoxFit.contain,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

      /// NAVBAR
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}