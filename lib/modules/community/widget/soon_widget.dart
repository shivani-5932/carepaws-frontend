import 'package:flutter/material.dart';

class SoonWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  const SoonWidget({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EE),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1EE),
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            /// 🔹 Center Space + Text
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "Soon",
                  style: TextStyle(
                    fontSize: size.width * 0.09,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7B5E57),
                  ),
                ),
              ),
            ),

            /// 🔹 Bottom Image
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  imagePath,
                  height: size.height * 0.28,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}