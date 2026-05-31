import 'package:care_paws/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomHeader({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,

      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),

      title: Text(
        title,
        style: AppTextStyles.h1.copyWith(color: Colors.black),
      ),

      actions: [
        InkWell(
          child: SvgPicture.asset(
            "assets/icons/cat.svg",
            height: 32,
            width: 32,
            // colorFilter: const ColorFilter.mode(
            //   Colors.black,
            //   BlendMode.srcIn,
            // ),
          ),
          onTap: (){
            Navigator.pushNamed(context, '/message');
          },
        ),
        const SizedBox(width: 12),
        Image.asset(
          "assets/icons/notification.png",
          height: 32,
          width: 32,
          // colorFilter: const ColorFilter.mode(
          //   Colors.black,
          //   BlendMode.srcIn,
          // ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}