import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_outline_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.signup.tr(),
        showShadow: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.hp),
              child: Text(
                LocaleKeys.registerNewAccount.tr(),
                style: appTextTheme.bodyLargeMedium.copyWith(fontSize: 25.hp),
              ),
            ),
            SizedBox(
              height: 20.hp,
            ),
            CustomTextField(
              label: LocaleKeys.fullName.tr(),
              hintText: LocaleKeys.enterFullName.tr(),
              textInputType: TextInputType.name,
              isRequired: true,
            ),
            CustomTextField(
              label: LocaleKeys.email.tr(),
              hintText: LocaleKeys.enterEmail.tr(),
              textInputType: TextInputType.emailAddress,
              isRequired: true,
            ),
            CustomTextField(
              label: LocaleKeys.password.tr(),
              hintText: LocaleKeys.enterPassword.tr(),
              isPassword: true,
              isRequired: true,
            ),
            CustomTextField(
              label: LocaleKeys.phoneNumber.tr(),
              hintText: LocaleKeys.enterPhoneNumber.tr(),
              textInputType: TextInputType.phone,
              maxLength: 10,
              isRequired: true,
            ),
            SizedBox(
              height: 20.hp,
            ),
            CustomRoundedButtom(
              horizontalMargin: 20.hp,
              title: LocaleKeys.signup.tr(),
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
                title: LocaleKeys.singupWithGoogle.tr(),
                onPressed: () {},
                leftIcon: FontAwesomeIcons.google,
              ),
            ),
            SizedBox(
              height: 50.hp,
            ),
          ],
        ),
      ),
    );
  }
}
