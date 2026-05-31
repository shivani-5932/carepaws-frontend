import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonRecordTile extends StatelessWidget {
  final String title;
  final String date;
  final String iconPath;

  const CommonRecordTile({
    super.key,
    required this.title,
    required this.date,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// TILE CONTENT
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),

          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [

              /// LEFT SIDE
              Row(
                children: [

                  /// SVG ICON
                  SvgPicture.asset(
                    iconPath,
                    height: 16,
                    width: 16,
                    color: Colors.black54,
                  ),

                  const SizedBox(width: 8),

                  /// TITLE
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              /// RIGHT DATE
              Text(
                date,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        /// Divider
        Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}