import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/routes/routes.dart';

import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:lucide_icons/lucide_icons.dart';

class OptionTileWidget extends StatelessWidget {
  const OptionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    List<Map<String, dynamic>> data = [
      {
        "title": Text(
          LocaleKeys.fertilizerCalculator.tr(),
          style: appTextTheme.bodyLargeSemiBold,
        ),
        "icon": Icon(
          LucideIcons.sprout,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
        "arrow": Icon(
          LucideIcons.chevronRight,
          size: 22.wp,
          color: AppColors.goldenColor,
        ),
        "onTap": Routes.fertilizerCalculator
      },
      {
        "title": Text(
          LocaleKeys.disease.tr(),
          style: appTextTheme.bodyLargeSemiBold,
        ),
        "icon": Icon(
          LucideIcons.bug,
          size: 40.wp,
          color: AppColors.goldenColor,
        ),
        "arrow": Icon(
          LucideIcons.chevronRight,
          size: 22.wp,
          color: AppColors.goldenColor,
        ),
        "onTap": Routes.diseases,
      },
    ];
    return SliverAnimatedGrid(
        initialItemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.2,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index, animation) {
          return GestureDetector(
            child: Card(
              color: AppColors.grey.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data[index]["icon"]!,
                    SizedBox(
                      height: 30.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [data[index]["title"]!, data[index]["arrow"]!],
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(data[index]["onTap"]);
            },
          );
        });
  }
}
