import 'package:flutter/material.dart';

class UploadHeaderWidget extends StatelessWidget {
  const UploadHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      child: Row(
        children: [

          const Icon(Icons.arrow_back),

          const SizedBox(width: 10),

          const Text(
            "Upload",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}