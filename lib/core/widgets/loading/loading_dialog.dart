import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

showLoadingDialog(BuildContext context, bool isLoading) {
  isLoading
      ? showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const _LoadingDialog(),
        )
      : null;
}

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return PopScope(
      canPop: false,
      child: Dialog(
        backgroundColor: AppColors.backgroundColor.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(
                color: AppColors.white,
                radius: 16,
              ),
              SizedBox(height: 14.hp),
              Text(
                LocaleKeys.loading.tr(),
                style: appTextTheme.bodyLargeSemiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
