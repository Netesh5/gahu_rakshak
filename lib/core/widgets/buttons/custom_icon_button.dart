import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final Color? iconColor;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.borderRadius = 100,
    this.padding = 9,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(padding),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.primaryLight,
          size: 26,
        ),
      ),
    );
  }
}
