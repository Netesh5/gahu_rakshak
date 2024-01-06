// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/custom_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputType? textInputType;
  final double bottomPadding;
  final double rightPadding;
  final double leftPadding;
  final String fieldName;
  final bool obscureText;
  final bool readOnly;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool isRequired;
  final VoidCallback? onPressed;
  final bool isFilled;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final bool isPassword;

  const CustomTextField({
    super.key,
    String? fieldName,
    required this.label,
    required this.hintText,
    this.textInputType,
    this.bottomPadding = 16,
    this.rightPadding = CustomTheme.pagePadding,
    this.leftPadding = CustomTheme.pagePadding,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.isRequired = false,
    this.onPressed,
    this.isFilled = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isPassword = false,
  }) : fieldName = fieldName ?? label;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Container(
      margin: EdgeInsets.only(
        bottom: widget.bottomPadding,
        left: widget.leftPadding,
        right: widget.rightPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label.isNotEmpty)
            RichText(
              text: TextSpan(
                text: widget.label,
                style: appTextTheme.label,
                children: [
                  if (widget.isRequired)
                    TextSpan(
                      text: " *",
                      style: appTextTheme.label.copyWith(
                        color: AppColors.red,
                      ),
                    )
                ],
              ),
            ),
          if (widget.label.isNotEmpty) SizedBox(height: 6.hp),
          FormBuilderTextField(
            name: widget.fieldName,
            style:
                appTextTheme.bodyLargeRegular.copyWith(color: AppColors.white),
            validator: widget.validator,
            controller: widget.controller,
            cursorColor: AppColors.white,
            maxLines: widget.maxLines,
            keyboardType: widget.textInputType,
            obscureText: obscure,
            readOnly: widget.readOnly,
            onTap: widget.onPressed,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged != null
                ? (val) => widget.onChanged!(val ?? "")
                : null,
            decoration: InputDecoration(
              border: getBorder(
                colorTheme: AppColors.grey,
                isFilled: widget.isFilled,
              ),
              enabledBorder: getBorder(
                colorTheme: AppColors.goldenColor,
                isFilled: widget.isFilled,
              ),
              focusedBorder: getBorder(
                colorTheme: AppColors.goldenColor,
                isFilled: widget.isFilled,
              ),
              disabledBorder: getBorder(
                colorTheme: AppColors.grey,
                isFilled: widget.isFilled,
              ),
              errorBorder: getBorder(
                colorTheme: AppColors.red,
                isFilled: widget.isFilled,
                isError: true,
              ),
              focusedErrorBorder: getBorder(
                colorTheme: AppColors.red,
                isFilled: widget.isFilled,
                isError: true,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              errorStyle: appTextTheme.formhelper.copyWith(
                color: AppColors.red,
              ),
              fillColor: widget.readOnly ? AppColors.grey : AppColors.grey,
              filled: widget.readOnly || widget.isFilled,
              counterText: "",
              hintText: widget.hintText,
              hintStyle: appTextTheme.formInput,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      size: 19,
                      color: AppColors.grey,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                      child: Icon(
                        obscure ? Icons.visibility_off : Icons.remove_red_eye,
                        size: 19,
                        color: AppColors.grey,
                      ),
                    )
                  : Icon(
                      widget.suffixIcon,
                      size: 19,
                      color: AppColors.grey,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  InputBorder getBorder({
    bool isError = false,
    required bool isFilled,
    required colorTheme,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: isError
            ? AppColors.red
            : (isFilled ? AppColors.grey : AppColors.grey),
      ),
    );
  }
}
