import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';

import 'package:gahurakshak/features/pets_diseases/data/models/disease_detail_param.dart';

class DiseaseDetailBody extends StatelessWidget {
  const DiseaseDetailBody({super.key, required this.param});

  final DiseaseDetailParam param;
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: param.title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                param.title,
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 25.hp),
              ),
              SizedBox(
                height: 40.hp,
              ),
              CarouselSlider(
                items: List.generate(
                  param.images.length,
                  (index) {
                    return CachedNetworkImage(
                      imageUrl: param.images[index],
                    );
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
                        LocaleKeys.description.tr(),
                        style: appTextTheme.bodyLargeSemiBold
                            .copyWith(fontSize: 20.hp),
                      ),
                      SizedBox(
                        height: 20.hp,
                      ),
                      Text(
                        param.diseaseDesc,
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
            ],
          ),
        ),
      ),
    );
  }
}
