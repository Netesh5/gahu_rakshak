import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/features/constants/locale_keys.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  LocaleKeys.appName.tr(),
                  style: appTextTheme.bodyLargeMedium.copyWith(fontSize: 30.hp),
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Text(
                LocaleKeys.login.tr(),
                style: appTextTheme.bodyLargeMedium.copyWith(fontSize: 25.hp),
              ),
              SizedBox(
                height: 20.hp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
