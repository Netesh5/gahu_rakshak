import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/theme/custom_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class BottomSheetWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double spaceBetween;
  const BottomSheetWrapper({
    super.key,
    this.icon,
    required this.title,
    required this.child,
    this.onPressed,
    this.spaceBetween = 16,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10.hp),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: CustomTheme.pagePadding,
            vertical: 15.hp,
          ),
          margin: EdgeInsets.only(bottom: spaceBetween),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: appTextTheme.drawerHeader.copyWith(
                  color: AppColors.grey,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(
                  CustomTheme.borderRadius,
                ),
                onTap: () {
                  if (onPressed != null) {
                    onPressed!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Icon(
                  icon ?? Icons.close_rounded,
                  size: 24,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
