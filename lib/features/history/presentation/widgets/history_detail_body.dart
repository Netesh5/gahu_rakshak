import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/images/custom_network_image.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/history/presentation/widgets/build_paragraph.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';

class HistoryDetailBody extends StatelessWidget {
  const HistoryDetailBody({super.key, required this.model});
  final ResultModel model;

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.history.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "historyDetailImage${model.index}",
                child: CustomCachedNetworkImage(
                  url: model.imagePath,
                  fit: BoxFit.fitWidth,
                  height: 300.hp,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Text(
                model.diseaseName,
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 25.hp),
              ),
              Text(
                  "Confidence : ${(num.parse(model.confidence) * 100).toStringAsFixed(2)} %",
                  style: appTextTheme.bodyLargeRegular),
              SizedBox(
                height: 20.hp,
              ),
              Text(
                LocaleKeys.similarImages.tr(),
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 20.hp),
              ),
              SizedBox(
                height: 20.hp,
              ),
              CarouselSlider(
                items: List.generate(
                  model.similarImg?.length ?? 0,
                  (index) {
                    return CachedNetworkImage(
                        imageUrl: model.similarImg?[index] ?? "");
                  },
                ),
                options: CarouselOptions(
                  viewportFraction: 0.85,
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
                        LocaleKeys.causeOfDisease.tr(),
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        model.description ?? "",
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
                        LocaleKeys.recommendation.tr(),
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      buildParagraph(model.recommendation ?? "", appTextTheme)
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
                        LocaleKeys.medicine.tr(),
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        model.medicine ?? "",
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
