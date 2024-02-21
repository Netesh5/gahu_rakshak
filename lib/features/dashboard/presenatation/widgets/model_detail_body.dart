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
                primaryXAxis: const NumericAxis(
                  minimum: 0,
                  maximum: 50,
                ),
                primaryYAxis: const NumericAxis(
                  minimum: 0,
                  maximum: 1,
                ),
                series: [
                  LineSeries<EchopsWithAccuracyModel, double>(
                    // xAxisName: "Accuracy",
                    // yAxisName: "Epoch",
                    animationDuration: 3000,
                    color: AppColors.goldenColor,
                    dataSource: data.modelData,
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
        itemCount: 1,
      ),
    );
  }
}
