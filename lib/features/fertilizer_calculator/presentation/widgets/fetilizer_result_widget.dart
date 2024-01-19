import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/features/fertilizer_calculator/data/repository/calculate_fertilizer.dart';
import 'package:provider/provider.dart';

class FertilizerResultWidget extends StatelessWidget {
  const FertilizerResultWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Consumer<CalculateFertilizer>(
      builder: (context, value, state) {
        return Column(
          children: [
            SizedBox(
              height: 40.hp,
            ),
            Text(
              LocaleKeys.chooseFertilizer.tr(),
              style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 40.hp,
            ),
            //DAP/MOP/Urea
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${LocaleKeys.ssp.tr()} / ${LocaleKeys.mop.tr()} / ${LocaleKeys.urea.tr()}",
                      style:
                          appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20.hp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              LocaleKeys.ssp.tr(),
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                            Text(
                              "${value.pValue.ceil()}/${LocaleKeys.kg.tr()}",
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              LocaleKeys.mop.tr(),
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                            Text(
                              "${value.kValue.ceil()}/${LocaleKeys.kg.tr()}",
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              LocaleKeys.urea.tr(),
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                            Text(
                              "${value.nValue.ceil()}/${LocaleKeys.kg.tr()}",
                              style: appTextTheme.bodyLargeSemiBold,
                            ),
                            SizedBox(
                              height: 20.hp,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.hp,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.hp,
            ),
          ],
        );
      },
    );
  }
}
