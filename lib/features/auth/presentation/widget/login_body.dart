import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/custom_text_fields.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                LocaleKeys.appName.tr(),
                style: appTextTheme.bodyNormalBold.copyWith(fontSize: 28.hp),
              ),
            ),
            SizedBox(
              height: 20.hp,
            ),
            Padding(
              padding: EdgeInsets.all(20.hp),
              child: Text(
                LocaleKeys.login.tr(),
                style: appTextTheme.bodyLargeMedium.copyWith(fontSize: 25.hp),
              ),
            ),
            SizedBox(
              height: 20.hp,
            ),
            CustomTextField(label: LocaleKeys.email, hintText: "Enter Email"),
            CustomTextField(
                label: LocaleKeys.password, hintText: "Enter Password"),
            SizedBox(
              height: 20.hp,
            ),
            CustomRoundedButtom(
              horizontalMargin: 20.hp,
              title: LocaleKeys.login,
              color: AppColor.goldenColor,
              textColor: AppColor.black,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
