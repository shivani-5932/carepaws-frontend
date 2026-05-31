import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PetProfileTabsWidget extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onTap;

  const PetProfileTabsWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        buildTab(0, "assets/icons/post.svg"),
        buildTab(1, "assets/icons/clip_outline.svg"),
        buildTab(2, "assets/icons/mention.svg"),

      ],
    );
  }

  Widget buildTab(int index, String icon){

    final isSelected = selectedIndex == index;

    return GestureDetector(

      onTap: (){
        onTap(index);
      },

      child: Column(
        children: [

          SvgPicture.asset(
            icon,
            height: 22,
            color: isSelected
                ? const Color(0xff6F4E37)
                : Colors.grey,
          ),

          const SizedBox(height: 6),

          Container(
            height: 2,
            width: 30,
            color: isSelected
                ? const Color(0xff6F4E37)
                : Colors.transparent,
          )

        ],
      ),
    );
  }
}