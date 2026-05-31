import 'package:care_paws/modules/community/comments/widget/comment_input_bar_widget.dart';
import 'package:care_paws/modules/community/comments/widget/comment_item_widget.dart';
import 'package:flutter/material.dart';
import '../controller/comment_controller.dart';
import '../model/comment_model.dart';

class CommentsSheet extends StatefulWidget {
  const CommentsSheet({super.key});

  @override
  State<CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<CommentsSheet> {

  final CommentController controller = CommentController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(

      height: MediaQuery.of(context).size.height * 0.75,

      child: Column(
        children: [

          const SizedBox(height: 10),

          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Comments",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(

            child: controller.comments.isEmpty

                ? const Center(
              child: Text(
                "No Comments Yet !",
                style: TextStyle(
                  color: Color(0xff6F4E37),
                  fontSize: 18,
                ),
              ),
            )

                : ListView.builder(

              itemCount: controller.comments.length,

              itemBuilder: (context,index){

                return CommentItemWidget(

                  comment: controller.comments[index],

                  onDelete: () {

                    setState(() {
                      controller.deleteComment(index);
                    });

                  },

                );

              },

            ),
          ),

          CommentInputBarWidget(

            controller: commentController,

            onSend: () {

              setState(() {

                controller.addComment(

                  CommentModel(
                    image: "assets/images/dog1.png",
                    username: "Tuffy.709",
                    comment: commentController.text,
                    likes: "0",
                    isMine: true,
                  ),

                );

              });

              commentController.clear();

            },
          )

        ],
      ),
    );
  }
}