import 'package:flutter/material.dart';

class LikeAnimationWidget extends StatelessWidget {

  final bool show;

  const LikeAnimationWidget({super.key, required this.show});

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(

      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 300),

      child: Center(

        child: Container(

          decoration: BoxDecoration(

            boxShadow: [

              BoxShadow(
                color: const Color(0xffD2A679).withOpacity(.6),
                blurRadius: 40,
                spreadRadius: 5,
              )

            ],
          ),

          child: Image.asset(
            "assets/icons/paw.png",
            height: 90,
            color: const Color(0xff8B5E3C),
          ),
        ),
      ),
    );
  }
}