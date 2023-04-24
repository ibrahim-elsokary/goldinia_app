import 'package:flutter/material.dart';
import 'package:goldinia_app/core/utils/style_colors.dart';

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    super.key,
    required this.icon,
    this.iconColor = StyleColors.subColor,
    this.backgroundColor,
    this.onPressed,
  });

  final Widget icon;
  final BorderSide borderSide = const BorderSide(color: StyleColors.subColor);
  final Color iconColor;
  final Color? backgroundColor;
  final double size = 57;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: backgroundColor,
      width: size,
      height: size,
      decoration: ShapeDecoration(
        shape: CircleBorder(side: borderSide),
      ),
      child: IconButton(
        iconSize: size / 1.8,
        icon: icon,
        color: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}
