import 'package:care_paws/modules/community/homepage/search_explore/explore_grid_item.dart';
import 'package:care_paws/modules/community/homepage/search_explore/explore_item_model.dart';
import 'package:care_paws/modules/community/navbar/navbar_widget.dart';
import 'package:care_paws/modules/community/widget/search_bar_widget.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController exploreSearchController = TextEditingController();

  bool isSearching = false;

  /// Explore grid items
  final List<ExploreItemModel> items = [

    ExploreItemModel(
      image: "assets/images/dog1.png",
      isVideo: true,
      views: "424k",
    ),

    ExploreItemModel(
      image: "assets/images/bird.png",
      isVideo: true,
      views: "532",
    ),

    ExploreItemModel(
      image: "assets/images/cat1.png",
    ),

    ExploreItemModel(
      image: "assets/images/fish.png",
      isVideo: true,
      views: "568",
    ),

    ExploreItemModel(
      image: "assets/images/toys.png",
      isVideo: true,
      views: "236",
    ),

    ExploreItemModel(
      image: "assets/images/dog1.png",
      isVideo: true,
      views: "424k",
    ),

    ExploreItemModel(
      image: "assets/images/bird.png",
      isVideo: true,
      views: "532",
    ),

    ExploreItemModel(
      image: "assets/images/dogs.png",
    ),

    ExploreItemModel(
      image: "assets/images/fish.png",
      isVideo: true,
      views: "568",
    ),

    ExploreItemModel(
      image: "assets/images/dogs.png",
      isVideo: true,
      views: "236",
    ),

    ExploreItemModel(
      image: "assets/images/cat2.png",
      isVideo: true,
      views: "424k",
    ),

    ExploreItemModel(
      image: "assets/images/carrot.png",
      isVideo: true,
      views: "532",
    ),

    ExploreItemModel(
      image: "assets/images/cat1.png",
    ),

    ExploreItemModel(
      image: "assets/images/fish.png",
      isVideo: true,
      views: "568",
    ),

    ExploreItemModel(
      image: "assets/images/dogs.png",
      isVideo: true,
      views: "236",
    ),

    ExploreItemModel(
      image: "assets/images/dog1.png",
      isVideo: true,
      views: "424k",
    ),

    ExploreItemModel(
      image: "assets/images/bird.png",
      isVideo: true,
      views: "532",
    ),

    ExploreItemModel(
      image: "assets/images/cat2.png",
    ),

    ExploreItemModel(
      image: "assets/images/dog2.png",
      isVideo: true,
      views: "568",
    ),

    ExploreItemModel(
      image: "assets/images/rabbit.png",
      isVideo: true,
      views: "236",
    ),
  ];

  /// Recent searches (dummy for now)
  List<Map<String, dynamic>> recentSearches = [

    {
      "image": "assets/images/rabbit.png",
      "username": "Rabbitu.roll",
      "subtitle": "Mr. cutiepie",
    },

    {
      "image": "assets/images/rabbit2.png",
      "username": "Rab...565",
      "subtitle": "rabbit",
    },

    {
      "image": "assets/images/carrot.png",
      "username": "RABIT_Food",
      "subtitle": "Food by us",
      "verified": true
    },

    {
      "image": "assets/images/rabbit.png",
      "username": "Ra_toys",
      "subtitle": "🐰",
    }

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(12),
              child: SearchBarWidget(
                hintText: "Search pets...",
                controller: exploreSearchController,

                onChanged: (value) {

                  setState(() {
                    isSearching = value.isNotEmpty;
                  });

                },
              ),
            ),

            Expanded(

              child: isSearching

              /// SEARCH MODE
                  ? Column(
                children: [

                  if(recentSearches.isNotEmpty)

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),

                      child: Align(
                        alignment: Alignment.centerRight,

                        child: TextButton(

                          onPressed: () {

                            setState(() {
                              recentSearches.clear();
                            });

                          },

                          child: const Text(
                            "Clear All",
                            style: TextStyle(
                              color: Color(0xff6F4E37),
                            ),
                          ),
                        ),
                      ),
                    ),

                  Expanded(
                    child: ListView.builder(

                      itemCount: recentSearches.length,

                      itemBuilder: (context,index){

                        final user = recentSearches[index];

                        return ListTile(

                          leading: ProfileAvatarWidget(
                            image: user["image"],
                            size: 45,
                            hasStory: false,
                          ),

                          title: Row(
                            children: [

                              Text(user["username"]),

                              if(user["verified"] == true)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: SvgPicture.asset(
                                    "assets/icons/verified.svg",
                                    height: 16,
                                  ),
                                )

                            ],
                          ),

                          subtitle: Text(user["subtitle"]),

                          trailing: GestureDetector(
                            onTap: () {

                              setState(() {
                                recentSearches.removeAt(index);
                              });

                            },
                            child: const Icon(Icons.close),
                          ),

                        );

                      },
                    ),
                  )

                ],
              )

              /// NORMAL EXPLORE GRID
                  : GridView.builder(

                itemCount: items.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,

                ),

                itemBuilder: (context, index) {

                  return ExploreGridItem(
                    item: items[index],
                  );

                },
              ),
            )

          ],
        ),
      ),

      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}