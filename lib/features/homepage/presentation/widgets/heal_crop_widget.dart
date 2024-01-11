// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/features/homepage/presentation/widgets/take_a_picture_bottom_sheet.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HearYourCropWidget extends StatelessWidget {
  const HearYourCropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    List<Map<String, Widget>> data = [
      {
        "title": Text(
          LocaleKeys.takeAPicture.tr(),
          style: appTextTheme.bodyLargeSemiBold,
        ),
        "icon": Icon(
          LucideIcons.scan,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
      },
      {
        "title": Text(
          LocaleKeys.seeDiagnosis.tr(),
          style: appTextTheme.bodyLargeSemiBold,
        ),
        "icon": Icon(
          LucideIcons.smartphone,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
      },
      {
        "title": Text(
          LocaleKeys.getMedicine.tr(),
          style: appTextTheme.bodyLargeSemiBold,
        ),
        "icon": Icon(
          LucideIcons.pill,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
      },
      {
        "title": Text(
          "",
          style: appTextTheme.bodyLargeRegular,
        ),
        "icon": Icon(
          LucideIcons.chevronRight,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 300.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.grey.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.healYourCrop.tr(),
                  style:
                      appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 22.wp),
                ),
                SizedBox(
                  height: 30.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        data[0]["icon"]!,
                        SizedBox(
                          height: 20.hp,
                        ),
                        data[0]["title"]!,
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          LucideIcons.chevronRight,
                          size: 40.wp,
                          color: AppColors.goldenColor,
                        ),
                        SizedBox(
                          height: 30.hp,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        data[1]["icon"]!,
                        SizedBox(
                          height: 20.hp,
                        ),
                        data[1]["title"]!,
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          LucideIcons.chevronRight,
                          size: 40.wp,
                          color: AppColors.goldenColor,
                        ),
                        SizedBox(
                          height: 30.hp,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        data[2]["icon"]!,
                        SizedBox(
                          height: 20.hp,
                        ),
                        data[2]["title"]!,
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.hp,
                ),
                CustomRoundedButtom(
                  color: AppColors.goldenColor,
                  title: LocaleKeys.takeAPicture.tr(),
                  textColor: AppColors.black,
                  fontSize: 18,
                  onPressed: () {
                    showTakeAPictureBottomSheet(context);
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
