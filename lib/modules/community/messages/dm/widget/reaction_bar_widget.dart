import 'package:flutter/material.dart';
import '../model/reaction_model.dart';

class ReactionBarWidget extends StatelessWidget {

  final Function(ReactionModel) onReaction;

  ReactionBarWidget({super.key, required this.onReaction});

  final List<ReactionModel> reactions = [

    ReactionModel(emoji: "🐶", label: "Bark"),
    ReactionModel(emoji: "🐱", label: "Meow"),
    ReactionModel(emoji: "🐰", label: "Hop"),
    ReactionModel(emoji: "🐦", label: "Chirp"),
    ReactionModel(emoji: "🐴", label: "Neigh"),

  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: reactions.map((reaction) {

          return GestureDetector(

            onTap: () {
              onReaction(reaction);
            },

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),

              child: Text(
                reaction.emoji,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          );

        }).toList(),
      ),
    );
  }
}