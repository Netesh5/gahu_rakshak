import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no_data.png",
          height: 250.hp,
          width: 250.wp,
        ),
        SizedBox(
          height: 20.hp,
        ),
        Text(
          LocaleKeys.noData.tr(),
          style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20.wp),
        )
      ],
    ));
  }
}
