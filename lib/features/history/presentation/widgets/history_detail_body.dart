import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';

class HistoryDetailBody extends StatelessWidget {
  const HistoryDetailBody({super.key, required this.model});
  final ResultModel model;
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.wp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "historyDetailImage${model.index}",
                child: Image.network(
                  model.imagePath,
                  height: 300.hp,
                  width: double.infinity,
                ),
              ),
              Text(
                model.diseaseName,
                style: appTextTheme.bodyLargeSemiBold.copyWith(fontSize: 25.hp),
              ),
              Text(model.dateTime, style: appTextTheme.bodyLargeRegular),
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
                    return Image.network(
                      model.imagePath,
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
                height: 300.hp,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Container(
                height: 300.hp,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.hp,
              ),
              Container(
                height: 300.hp,
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
