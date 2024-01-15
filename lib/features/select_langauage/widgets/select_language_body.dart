// ignore_for_file: use_build_context_synchronously

import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/shared_prefrences/user_shared_prefrences.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/utils/snack_bar_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';

import 'package:selectable_box/selectable_box.dart';

class SelectLanguageBody extends StatefulWidget {
  const SelectLanguageBody({super.key, required this.userToken});
  final UserToken userToken;
  @override
  State<SelectLanguageBody> createState() => _SelectLanguageBodyState();
}

class _SelectLanguageBodyState extends State<SelectLanguageBody> {
  bool isNpSelected = false;
  bool isEnSelected = true;

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.selectLang.tr(),
        centerMiddle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.wp),
        child: Column(
          children: [
            SizedBox(
              height: 50.hp,
            ),
            Text(
              LocaleKeys.selectPerfLang.tr(),
              style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 22),
            ),
            SizedBox(
              height: 50.hp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableBox(
                  width: 150.wp,
                  height: 200.hp,
                  color: AppColors.backgroundColor,
                  onTap: () {
                    isNpSelected = !isNpSelected;
                    if (isNpSelected) {
                      isEnSelected = false;
                      context.setLocale(const Locale("ne", "NE"));
                    }
                    setState(() {});
                  },
                  showCheckbox: false,
                  selectedColor: AppColors.backgroundColor,
                  isSelected: isNpSelected,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CountryFlag.fromCountryCode(
                        "Np",
                        height: 150.hp,
                        width: 150.wp,
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        LocaleKeys.nepali.tr(),
                        style: appTextTheme.bodyLargeSemiBold,
                      )
                    ],
                  ),
                ),
                SelectableBox(
                  width: 150.wp,
                  height: 200.hp,
                  color: AppColors.backgroundColor,
                  onTap: () {
                    isEnSelected = !isEnSelected;
                    if (isEnSelected) {
                      isNpSelected = false;
                      context.setLocale(const Locale("en", "US"));
                    }
                    setState(() {});
                  },
                  showCheckbox: false,
                  selectedColor: AppColors.backgroundColor,
                  isSelected: isEnSelected,
                  child: Column(
                    children: [
                      CountryFlag.fromCountryCode(
                        "Us",
                        height: 150.hp,
                        width: 200.wp,
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        LocaleKeys.english.tr(),
                        style: appTextTheme.bodyLargeSemiBold,
                      )
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            CustomRoundedButtom(
              color: AppColors.goldenColor,
              title: LocaleKeys.continueBtn.tr(),
              textColor: AppColors.black,
              onPressed: () async {
                await widget.userToken
                    .setPerferedLang(isNpSelected)
                    .then((value) async {
                  await UserToken(sp: DI.instance()).setIsFirstTime(false);
                  SnackBarUtils.showSuccessMessage(
                    context: context,
                    message: LocaleKeys.langSetSuccessfully.tr(),
                  );
                  Navigator.pushReplacementNamed(context, Routes.login);
                });
              },
            ),
            SizedBox(
              height: 100.hp,
            )
          ],
        ),
      ),
    );
  }
}
