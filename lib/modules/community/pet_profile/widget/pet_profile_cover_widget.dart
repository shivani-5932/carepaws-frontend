import 'package:flutter/material.dart';

class PetProfileCoverWidget extends StatelessWidget {
  const PetProfileCoverWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Image.asset(
      "assets/images/dog1.png",
      width: width,
      height: width * 0.4, // responsive height
      fit: BoxFit.cover,
    );
  }
}