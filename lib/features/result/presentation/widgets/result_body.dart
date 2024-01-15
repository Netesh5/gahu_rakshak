import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';

import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/history/presentation/widgets/build_paragraph.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.analyze.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 300.hp,
                width: double.infinity,
              ),
              Text(
                "Disease Name",
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 25.hp),
              ),
              Text("${DateTime.now()}", style: appTextTheme.bodyLargeRegular),
              SizedBox(
                height: 40.hp,
              ),
              Text(
                "Similar Images",
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20.hp),
              ),
              SizedBox(
                height: 20.hp,
              ),
              CarouselSlider(
                items: List.generate(
                  5,
                  (index) {
                    return Image.asset(
                      "assets/images/Ghau Rakshak.png",
                      height: 200.hp,
                    );
                  },
                ),
                options: CarouselOptions(
                  viewportFraction: 0.7,
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.grey.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cause of Disease",
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        LocaleKeys.spetoriaDesc.tr(),
                        style: appTextTheme.bodyLargeRegular
                            .copyWith(fontSize: 20.hp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.grey.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommendation",
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      buildParagraph(
                          LocaleKeys.spetoriaRecommendation.tr(), appTextTheme)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.grey.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Medicine",
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
