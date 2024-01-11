import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/bottom_sheets/custom_bottom_sheet_wrapper.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';

showTakeAPictureBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColors.backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (context) => const TakeAPictureBottomSheet(),
  );
}

class TakeAPictureBottomSheet extends StatelessWidget {
  const TakeAPictureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return BottomSheetWrapper(
        title: LocaleKeys.chooseAOption.tr(),
        child: Column(
          children: [
            ListTile(
              title: Text(
                LocaleKeys.chooseFromGallery.tr(),
                style: appTextTheme.bodyLargeSemiBold,
              ),
            ),
            ListTile(
              title: Text(
                LocaleKeys.takeAPicture.tr(),
                style: appTextTheme.bodyLargeSemiBold,
              ),
            ),
            SizedBox(
              height: 40.hp,
            )
          ],
        ));
  }
}
