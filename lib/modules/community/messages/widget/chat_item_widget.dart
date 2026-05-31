import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:care_paws/modules/community/widget/profile_avtar_widget.dart';
import 'package:flutter/material.dart';
import '../model/message_model.dart';

class ChatItemWidget extends StatefulWidget {

  final MessageModel chat;

  const ChatItemWidget({super.key, required this.chat});

  @override
  State<ChatItemWidget> createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {

  late bool isUnread;


  @override
  void initState() {
    super.initState();
    isUnread = widget.chat.unread;
  }

  void markAsRead() {

    if (isUnread) {
      setState(() {
        isUnread = false;
      });
    }

    /// Yaha navigation bhi add kar sakte ho later
    print("Open chat");
  }



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),

      child: InkWell(

        onTap: markAsRead,

        child: Row(
          children: [
        
            ProfileAvatarWidget(
              image: widget.chat.profileImage,
              size: 44,
            ),
        
            const SizedBox(width: 12),
        
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  Text(
                    widget.chat.username,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
        
                  const SizedBox(height: 2),
        
                  Text(
                    widget.chat.lastMessage,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isUnread
                          ? Colors.black   // 🔥 unread
                          : Colors.grey,   // 🔥 read

                      fontWeight: isUnread
                          ? FontWeight.w600   // 🔥 unread = bold/thoda strong
                          : FontWeight.w400,  // 🔥 read
                    ),
                  ),
                ],
              ),
            ),
        
            Column(
              children: [
        
                Text(
                  widget.chat.time,
                  style: AppTextStyles.bodySmall.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
        
                if(isUnread)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    height: 13,
                    width: 13,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.orange,
                      // shape: BoxShape.circle,
                    ),
                  )
        
              ],
            )
        
          ],
        ),
      ),
    );
  }
}