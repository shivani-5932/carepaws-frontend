import 'package:flutter/material.dart';

class SuccessImageWidget extends StatelessWidget {

  final String image;

  const SuccessImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 208,
      width: 208,

      decoration:  BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffD8CFC7), // same bg color
      ),


          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 320, // adjust according to your asset
          ),
    );
  }
}