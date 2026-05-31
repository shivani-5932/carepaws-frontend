import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/pet_profile/model/pet_profile_item_model.dart';

import 'package:flutter/material.dart';


class PetProfileGridWidget extends StatelessWidget {

  final List<PetProfileItemModel> items;

  const PetProfileGridWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {

    if(items.isEmpty){
      return  Center(
        child: Text(
          "No Content Yet",
          style: AppTextStyles.h2.copyWith(
            color: Color(0xff6F4E37),
            fontSize: 16,
          ),
        ),
      );
    }

    return GridView.builder(


      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: items.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,

      ),

      itemBuilder: (context, index){

        final item = items[index];

        return Stack(
          children: [

            Positioned.fill(
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
              ),
            ),

            /// Video Icon
            if(item.isVideo)
              const Positioned(
                right: 6,
                top: 6,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 18,
                ),
              ),

          ],
        );
      },
    );
  }
}