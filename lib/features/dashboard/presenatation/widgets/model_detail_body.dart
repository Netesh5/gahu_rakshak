import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ModelDetailBody extends StatelessWidget {
  const ModelDetailBody({super.key, required this.data});
  final MLDataModel data;
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(
        title: data.title,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 20.hp,
              ),
              SfCartesianChart(
                title: ChartTitle(
                  text: data.chartTitle,
                  textStyle: appTextTheme.bodyLargeSemiBold,
                ),
                primaryXAxis: NumericAxis(
                  minimum: 0,
                  maximum: 50,
                  labelStyle: appTextTheme.bodyOddNormal,
                  majorGridLines: MajorGridLines(
                    color: AppColors.grey.withOpacity(0.5),
                  ),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 1,
                  labelStyle: appTextTheme.bodyOddNormal,
                  majorGridLines: MajorGridLines(
                    color: AppColors.grey.withOpacity(0.5),
                  ),
                ),
                series: [
                  LineSeries<EchopsWithAccuracyModel, double>(
                    animationDuration: 3000,
                    color: AppColors.goldenColor,
                    dataSource: data.modelData[index]["train"],
                    xValueMapper: (EchopsWithAccuracyModel model, _) =>
                        double.parse(model.echops.toString()),
                    yValueMapper: (EchopsWithAccuracyModel model, _) =>
                        model.accuracy,
                  ),
                  LineSeries<EchopsWithAccuracyModel, double>(
                    animationDuration: 3000,
                    color: AppColors.white,
                    dataSource: data.modelData[index]["validation"],
                    xValueMapper: (EchopsWithAccuracyModel model, _) =>
                        double.parse(model.echops.toString()),
                    yValueMapper: (EchopsWithAccuracyModel model, _) =>
                        model.accuracy,
                  ),
                ],
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20.hp,
          );
        },
        itemCount: data.modelData.length,
      ),
    );
  }
}
