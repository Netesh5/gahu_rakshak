import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/dialogs/success_dialog_clipper.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_outline_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';

showDecisionDialog({
  required BuildContext context,
  required String message,
  VoidCallback? onYesPressed,
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: animation,
        child: FadeTransition(
          opacity: animation,
          child: _DecisionDialog(message: message, onYesPressed: onYesPressed),
        ),
      );
    },
  );
}

class _DecisionDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onYesPressed;
  const _DecisionDialog({
    required this.message,
    this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipPath(
        clipper: SuccessDialogClipper(),
        child: Container(
          height: 160.hp,
          color: AppColors.backgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 42,
                width: 42,
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.hp),
              Text(
                message,
                textAlign: TextAlign.center,
                style: appTextTheme.bodyLargeSemiBold,
              ),
              SizedBox(height: 16.hp),
              Row(
                children: [
                  Expanded(
                    child: CustomRoundedButtom(
                      title: LocaleKeys.no.tr(),
                      color: AppColors.goldenColor,
                      textColor: AppColors.black,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(width: 16.hp),
                  Expanded(
                    child: CustomOutlineButton(
                      title: LocaleKeys.yes.tr(),
                      borderColor: AppColors.grey,
                      textColor: AppColors.white,
                      onPressed: () {
                        if (onYesPressed != null) {
                          onYesPressed!();
                        } else {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
