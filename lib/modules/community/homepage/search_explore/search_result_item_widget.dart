import 'package:care_paws/modules/community/homepage/search_explore/model/search_user_model.dart';
import 'package:flutter/material.dart';
import '../../widget/profile_avtar_widget.dart';


class SearchResultItemWidget extends StatelessWidget {

  final SearchUserModel user;
  final VoidCallback onRemove;

  const SearchResultItemWidget({
    super.key,
    required this.user,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(

      leading: ProfileAvatarWidget(
        image: user.image,
        size: 45,
        hasStory: false,
      ),

      title: Row(
        children: [

          Text(user.username),

          if(user.verified)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset(
                "assets/icons/verified.png",
                height: 16,
              ),
            )

        ],
      ),

      subtitle: Text(user.subtitle),

      trailing: GestureDetector(
        onTap: onRemove,
        child: const Icon(Icons.close),
      ),
    );
  }
}