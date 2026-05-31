import 'package:flutter/material.dart';
import 'highlight_item_widget.dart';

class PetProfileHighlightsWidget extends StatelessWidget {
  const PetProfileHighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final highlights = [

      {"image": "assets/images/dog1.png", "title": "Highlights"},
      {"image": "assets/images/dog2.png", "title": "My Food"},
      {"image": "assets/images/toys.png", "title": "My toys"},
      {"image": "assets/images/dogs.png", "title": "Favorite Trio"},
      {"image": "assets/images/dog1.png", "title": "Highlights"},
      {"image": "assets/images/dog2.png", "title": "My Food"},
      {"image": "assets/images/toys.png", "title": "My toys"},
      {"image": "assets/images/dogs.png", "title": "Favorite Trio"},
      {"image": "assets/images/dog1.png", "title": "Highlights"},
      {"image": "assets/images/dog2.png", "title": "My Food"},
      {"image": "assets/images/toys.png", "title": "My toys"},
      {"image": "assets/images/dogs.png", "title": "Favorite Trio"},
      {"image": "assets/images/dog1.png", "title": "Highlights"},
      {"image": "assets/images/dog2.png", "title": "My Food"},
      {"image": "assets/images/toys.png", "title": "My toys"},
      {"image": "assets/images/dogs.png", "title": "Favorite Trio"},

    ];

    return SizedBox(
      height: 100,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: highlights.length,

        itemBuilder: (context,index){

          final item = highlights[index];

          return HighlightItemWidget(
            image: item["image"]!,
            title: item["title"]!,
          );

        },
      ),
    );
  }
}