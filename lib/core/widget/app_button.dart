import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, tertiary, destructive }
enum ButtonSize { large, medium, small }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.large,
    this.isLoading = false,
  });

  double getHeight() {
    switch (size) {
      case ButtonSize.large:
        return 52;
      case ButtonSize.medium:
        return 44;
      case ButtonSize.small:
        return 36;
    }
  }

  Color getBackground() {
    switch (type) {
      case ButtonType.primary:
        return const Color(0xFF3B2F2F); // Espresso
      case ButtonType.secondary:
      case ButtonType.tertiary:
        return Colors.transparent;
      case ButtonType.destructive:
        return const Color(0xFFC44536);
    }
  }

  Color getTextColor() {
    switch (type) {
      case ButtonType.primary:
      case ButtonType.destructive:
        return Colors.white;
      default:
        return const Color(0xFF3B2F2F);
    }
  }

  BorderSide? getBorder() {
    if (type == ButtonType.secondary) {
      return const BorderSide(color: Color(0xFF3B2F2F));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackground(),
          foregroundColor: getTextColor(),
          elevation: 0,
          side: getBorder(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}