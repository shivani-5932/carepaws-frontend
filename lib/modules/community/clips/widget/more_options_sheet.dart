import 'package:flutter/material.dart';

class MoreOptionsSheet extends StatelessWidget {
  const MoreOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [

          ListTile(
            leading: const Icon(Icons.bookmark_border),
            title: const Text("Save"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.link),
            title: const Text("Copy Link"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.report_outlined),
            title: const Text("Report"),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Not Interested"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}