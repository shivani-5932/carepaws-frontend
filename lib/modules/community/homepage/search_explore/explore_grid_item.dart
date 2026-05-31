import 'package:care_paws/modules/community/homepage/search_explore/explore_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ExploreGridItem extends StatelessWidget {

  final ExploreItemModel item;

  const ExploreGridItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Positioned.fill(
          child: Image.asset(
            item.image,
            fit: BoxFit.cover,
          ),
        ),

        if (item.isVideo)
          Positioned(
            left: 6,
            bottom: 6,
            child: Row(
              children: [

                SvgPicture.asset(
                  "assets/icons/play.svg",
                  height: 14,
                  color: Colors.white,
                ),

                const SizedBox(width: 4),

                Text(
                  item.views,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}