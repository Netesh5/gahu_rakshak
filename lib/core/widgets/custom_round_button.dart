import 'package:flutter/material.dart';
import 'package:gahurakshak/core/animations/tap_effect.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class CustomRoundedButtom extends StatefulWidget {
  const CustomRoundedButtom({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.color,
    this.horizontalPadding = 12,
    this.verticalPadding = 12.5,
    this.fontSize = 16,
    this.textColor,
    this.fontWeight = FontWeight.w500,
    this.horizontalMargin = 0,
    this.icon,
    this.iconColor,
  });
  final String title;
  final Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final double horizontalMargin;
  final IconData? icon;
  final Color? iconColor;

  @override
  CustomRoundedButtomState createState() => CustomRoundedButtomState();
}

class CustomRoundedButtomState extends State<CustomRoundedButtom> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return TapEffect(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Material(
          color: widget.isDisabled
              ? AppColor.grey
              : (widget.color ?? theme.primaryColor),
          borderRadius: BorderRadius.circular(4),
          child: InkWell(
            onTap: widget.isDisabled ? null : widget.onPressed,
            borderRadius: BorderRadius.circular(4),
            child: Container(
              padding: widget.padding ??
                  EdgeInsets.symmetric(
                    vertical: widget.verticalPadding,
                    horizontal: widget.horizontalPadding,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: widget.isDisabled
                      ? AppColor.grey
                      : (widget.color ?? theme.primaryColor),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: appTextTheme.button.copyWith(
                        fontWeight: widget.fontWeight,
                        color: widget.isDisabled
                            ? AppColor.grey
                            : widget.textColor,
                        fontSize: widget.fontSize,
                      ),
                    ),
                    if (widget.icon != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.wp),
                        margin: EdgeInsets.only(top: 1.hp),
                        child: Icon(
                          widget.icon,
                          color: widget.iconColor ?? AppColor.grey,
                          size: widget.fontSize,
                        ),
                      ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeOut,
                      child: widget.isLoading
                          ? Container(
                              height: 14,
                              width: 14,
                              margin: const EdgeInsets.only(left: 8),
                              child: const CircularProgressIndicator(
                                color: AppColor.grey,
                                strokeWidth: 2,
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
