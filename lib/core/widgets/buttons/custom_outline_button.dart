import 'package:flutter/material.dart';
import 'package:gahurakshak/core/animations/tap_effect.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class CustomOutlineButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final Color? borderColor;
  final Function()? onPressed;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? leftIcon;
  final IconData? rightIcon;

  const CustomOutlineButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.textColor,
    this.horizontalPadding = 20.0,
    this.verticalPadding = 12.5,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return TapEffect(
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.backgroundColor,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: horizontalPadding,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ?? AppColors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leftIcon != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.wp),
                    margin: EdgeInsets.only(top: 1.hp),
                    child: Icon(
                      leftIcon,
                      color: textColor ?? AppColors.goldenColor,
                      size: 20,
                    ),
                  ),
                Text(
                  title,
                  style: appTextTheme.button.copyWith(
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    color: textColor ?? AppColors.grey,
                  ),
                ),
                if (rightIcon != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.wp),
                    margin: EdgeInsets.only(top: 1.hp),
                    child: Icon(
                      rightIcon,
                      color: textColor ?? AppColors.grey,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
