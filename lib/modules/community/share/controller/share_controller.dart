import 'package:care_paws/modules/community/share/model/share_user_model.dart';
import 'package:flutter/material.dart';

class ShareController {

  List<ShareUserModel> users = [

  ShareUserModel(
  image: "assets/images/cat1.png",
  username: "Princess",
  ),

  ShareUserModel(
  image: "assets/images/rabbit1.png",
  username: "Rabbitu.roll",
  ),

  ShareUserModel(
  image: "assets/images/dog1.png",
  username: "snuffer....43",
  verified: true,
  ),

    ShareUserModel(
      image: "assets/images/dog2.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/dog2.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/dog1.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/dog2.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/rabbit1.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/dog1.png",
      username: "snuffer....43",
      verified: true,
    ),

    ShareUserModel(
      image: "assets/images/cat1.png",
      username: "snuffer....43",
      verified: true,
    ),

  ];

  bool hasSelection() {
  return users.any((user) => user.selected);
  }

  void toggleSelection(int index) {
  users[index].selected = !users[index].selected;
  }

  }

  /// Close share sheet
  void closeShareSheet(BuildContext context) {
    Navigator.pop(context);
  }

  /// Show sent animation
  void showSentOverlay(BuildContext context) {

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {

        return Center(
          child: Material(
            color: Colors.transparent,

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),

              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.4),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// squirrel image
                  Image.asset(
                    "assets/images/squirrel.png",
                    height: 70,
                    color: Colors.white.withOpacity(.9),
                    colorBlendMode: BlendMode.modulate,
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Sent",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

