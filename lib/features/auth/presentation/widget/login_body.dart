import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_outline_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';
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
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(
                    "assets/images/Ghau Rakshak.png",
                  ),
                  radius: 50.wp,
                ),
                Center(
                  child: Text(
                    LocaleKeys.appName.tr(),
                    style:
                        appTextTheme.bodyNormalBold.copyWith(fontSize: 28.hp),
                  ),
                ),
              ],
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
            CustomTextField(
                label: LocaleKeys.email.tr(), hintText: "Enter Email"),
            CustomTextField(
                label: LocaleKeys.password.tr(), hintText: "Enter Password"),
            SizedBox(
              height: 20.hp,
            ),
            CustomRoundedButtom(
              horizontalMargin: 20.hp,
              title: LocaleKeys.login.tr(),
              color: AppColors.goldenColor,
              textColor: AppColors.black,
              onPressed: () {},
            ),
            SizedBox(
              height: 50.hp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.hp),
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  SizedBox(
                    width: 10.wp,
                  ),
                  Text(
                    LocaleKeys.or.tr(),
                    style: appTextTheme.bodyNormalBold,
                  ),
                  SizedBox(
                    width: 10.wp,
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(
              height: 50.hp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.wp),
              child: CustomOutlineButton(
                title: LocaleKeys.loginWithGoogle.tr(),
                onPressed: () {},
                leftIcon: Icons.abc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
