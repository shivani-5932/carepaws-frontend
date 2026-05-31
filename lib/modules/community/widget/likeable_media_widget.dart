import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeableMediaWidget extends StatefulWidget {

  final Widget child;
  final bool initialLiked;
  final Function(bool)? onLikeChanged;

  const LikeableMediaWidget({
    super.key,
    required this.child,
    this.initialLiked = false,
    this.onLikeChanged,
  });

  @override
  State<LikeableMediaWidget> createState() =>
      _LikeableMediaWidgetState();
}

class _LikeableMediaWidgetState
    extends State<LikeableMediaWidget> {

  late bool isLiked;
  bool showAnimation = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initialLiked;
  }

  /// ❤️ DOUBLE TAP → LIKE + ANIMATION
  void handleDoubleTap() {

    setState(() {
      isLiked = true;
      showAnimation = true;
    });

    widget.onLikeChanged?.call(isLiked);

    Future.delayed(
      const Duration(milliseconds: 700),
          () {
        if (mounted) {
          setState(() {
            showAnimation = false;
          });
        }
      },
    );
  }

  /// ❤️ SINGLE TAP → TOGGLE LIKE
  void handleSingleTap() {

    setState(() {
      isLiked = !isLiked;
    });

    widget.onLikeChanged?.call(isLiked);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: handleSingleTap,
      onDoubleTap: handleDoubleTap,

      child: Stack(
        alignment: Alignment.center,

        children: [

          /// VIDEO / IMAGE
          widget.child,

          /// ❤️ DOUBLE TAP ICON
          AnimatedOpacity(
            opacity: showAnimation ? 1 : 0,
            duration: const Duration(milliseconds: 250),

            child: SvgPicture.asset(
              "assets/icons/paw_liked.svg",
              height: 90,

              /// remove heavy shadow
              colorFilter: const ColorFilter.mode(
                Color(0xff8B5E3C),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}