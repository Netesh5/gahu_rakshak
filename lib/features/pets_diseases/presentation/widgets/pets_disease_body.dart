import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/constants/similar_images.dart';
import 'package:gahurakshak/core/routes/routes.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/pets_diseases/data/models/disease_detail_param.dart';

class PetsAndDiseaseBody extends StatelessWidget {
  PetsAndDiseaseBody({super.key});

  final List totalDiseases = [
    {
      "title": LocaleKeys.septoria.tr(),
      "images": septoriaImg,
      "desc": LocaleKeys.spetoriaDesc.tr(),
    },
    {
      "title": LocaleKeys.brownRust.tr(),
      "images": brownRustImg,
      "desc": LocaleKeys.brownRustDesc.tr(),
    },
    {
      "title": LocaleKeys.yellowRust.tr(),
      "images": yellowRustImg,
      "desc": LocaleKeys.yellowRustDesc.tr(),
    },
    {
      "title": LocaleKeys.stripRust.tr(),
      "images": stripRust,
      "desc": LocaleKeys.stripRustDesc.tr(),
    },
    {
      "title": LocaleKeys.leafRust.tr(),
      "images": leafRust,
      "desc": LocaleKeys.leafRustDesc.tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.disease.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: totalDiseases.length,
          itemBuilder: (context, index) {
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
                      CachedNetworkImage(
                        imageUrl: totalDiseases[index]["images"].first,
                      ),
                      SizedBox(
                        height: 10.hp,
                      ),
                      Text(
                        totalDiseases[index]["title"],
                        style: appTextTheme.bodyLargeSemiBold,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  Routes.diseasesDetail,
                  arguments: DiseaseDetailParam(
                    title: totalDiseases[index]["title"],
                    diseaseDesc: totalDiseases[index]["desc"],
                    images: totalDiseases[index]["images"],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
