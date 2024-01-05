import 'package:flutter/material.dart';
import 'package:gahurakshak/core/animations/tap_effect.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/container/shadow_container.dart';

class CustomFilledButton extends StatelessWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String title;
  final Color? fillColor;
  final VoidCallback? onPressed;
  final EdgeInsets? containerMargin;
  final Color? iconColor;
  const CustomFilledButton({
    super.key,
    required this.title,
    this.fillColor,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.iconColor,
    this.containerMargin,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return TapEffect(
      scaleDown: 0.95,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: ShadowContainer(
          cardColor: fillColor,
          containerPadding: const EdgeInsets.all(14),
          containerMargin: containerMargin ??
              const EdgeInsets.all(
                0,
              ),
          child: Row(
            children: [
              if (prefixIcon != null)
                Container(
                  padding: EdgeInsets.only(right: 10.wp),
                  child: Icon(
                    prefixIcon,
                    color: iconColor ?? AppColors.primaryLight,
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: appTextTheme.bodyNormalMedium.copyWith(
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              if (suffixIcon != null)
                Container(
                  padding: EdgeInsets.only(left: 10.wp),
                  child: Icon(
                    suffixIcon,
                    color: iconColor ?? AppColors.primaryLight,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
