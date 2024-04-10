import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_decoration_theme.dart';
import 'package:gahurakshak/core/theme/custom_theme.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    required this.child,
    this.onPressed,
    this.containerMargin,
    this.containerPadding,
    this.cardColor,
    this.height,
    this.width,
  });
  final Widget child;
  final Color? cardColor;
  final VoidCallback? onPressed;
  final EdgeInsets? containerMargin;
  final EdgeInsets? containerPadding;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final appDecorationTheme =
        Theme.of(context).extension<AppDecorationTheme>();

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding:
            containerPadding ?? const EdgeInsets.all(CustomTheme.cardPadding),
        margin: containerMargin ??
            const EdgeInsets.only(
              left: CustomTheme.pagePadding,
              right: CustomTheme.pagePadding,
              bottom: CustomTheme.cardBottomMargin,
              top: CustomTheme.cardBottomMargin,
            ),
        decoration: BoxDecoration(
          color: cardColor ?? AppColors.grey,
          boxShadow: [appDecorationTheme!.e1],
          borderRadius: BorderRadius.circular(CustomTheme.borderRadius),
        ),
        child: child,
      ),
    );
  }
}
