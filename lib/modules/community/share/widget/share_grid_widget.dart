import 'package:care_paws/modules/community/share/model/share_user_model.dart';
import 'package:care_paws/modules/community/share/widget/share_user_item_widget.dart';
import 'package:flutter/material.dart';

class ShareGridWidget extends StatelessWidget {

  final List<ShareUserModel> users;
  final Function(int) onSelect;

  const ShareGridWidget({
    super.key,
    required this.users,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded( // 🔥 makes it scrollable
      child: GridView.builder(

        itemCount: users.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10, // 🔥 reduced spacing
          crossAxisSpacing: 10,
          childAspectRatio: .8,
        ),

        itemBuilder: (context, index) {

          return ShareUserItemWidget(
            user: users[index],
            onTap: () => onSelect(index),
          );

        },
      ),
    );
  }
}