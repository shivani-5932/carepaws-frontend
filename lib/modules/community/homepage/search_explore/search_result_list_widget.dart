import 'package:flutter/material.dart';
import 'package:care_paws/modules/community/homepage/search_explore/controller/search_controller.dart';
import 'search_result_item_widget.dart';

class SearchResultListWidget extends StatelessWidget {

  final SearchExploreController controller;
  final Function() refresh;

  const SearchResultListWidget({
    super.key,
    required this.controller,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {

    if(controller.results.isEmpty){
      return const SizedBox();
    }

    return Column(
      children: [

        /// Clear All
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              controller.clearAll();
              refresh();
            },
            child: const Text(
              "Clear All",
              style: TextStyle(
                color: Color(0xff6F4E37),
              ),
            ),
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: controller.results.length,

          itemBuilder: (context,index){

            return SearchResultItemWidget(

              user: controller.results[index],

              onRemove: () {
                controller.removeItem(index);
                refresh();
              },

            );

          },
        ),

      ],
    );
  }
}