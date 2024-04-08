import 'package:flutter/material.dart';
import 'package:gahurakshak/core/extension/capitalize.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:gahurakshak/features/confusion_matrix/confusion_matrix.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ModelDetailBody extends StatelessWidget {
  ModelDetailBody({super.key, required this.data});
  final List<MLDataModel> data;
  final List<String> columns = ["Postivite", "Negative"];
  final List<String> rows = ["Postivite", "Negative"];
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Scaffold(
      appBar: CustomAppBar(
        title: data.first.title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 20.hp,
                      ),
                      SfCartesianChart(
                        title: ChartTitle(
                          text: data[index].chartTitle,
                          textStyle: appTextTheme.bodyLargeSemiBold,
                        ),
                        legend: Legend(
                            isVisible: true,
                            offset: const Offset(
                              100,
                              200,
                            ),
                            toggleSeriesVisibility: true,
                            textStyle: appTextTheme.bodyLargeRegular),
                        primaryXAxis: NumericAxis(
                          minimum: 0,
                          maximum: 20,
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
                            name: data[index].label1?.capitalize() ?? "",
                            animationDuration: 3000,
                            color: AppColors.goldenColor,
                            dataSource: data[index]
                                .lineChartmodelData[data[index].label1],
                            xValueMapper: (EchopsWithAccuracyModel model, _) =>
                                double.parse(model.echops.toString()),
                            yValueMapper: (EchopsWithAccuracyModel model, _) =>
                                model.accuracy,
                          ),
                          LineSeries<EchopsWithAccuracyModel, double>(
                            name: data[index].label2?.capitalize() ?? "",
                            animationDuration: 3000,
                            color: AppColors.white,
                            dataSource: data[index]
                                .lineChartmodelData[data[index].label2],
                            xValueMapper: (EchopsWithAccuracyModel model, _) =>
                                double.parse(model.echops.toString()),
                            yValueMapper: (EchopsWithAccuracyModel model, _) =>
                                model.accuracy,
                          ),
                        ], 
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.hp,
                  );
                },
                itemCount: data.length,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Confusion Matrix : VGG-16",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomPaint(
                  size: const Size(double.infinity, 30),
                  painter: ConfusionMatrixPainter(
                    xAxis: ["A", "B", "C", "D", "E", "F"],
                    yAxis: ["A", "B", "C", "D", "E", "F"],
                    data: [
                      [64, 4, 0, 0, 0, 0],
                      [1, 65, 1, 0, 0, 0],
                      [0, 8, 61, 0, 0, 0],
                      [0, 4, 1, 73, 0, 0],
                      [0, 1, 4, 0, 87, 0],
                      [0, 0, 0, 0, 0, 75],
                    ],
                    color: Colors.red,
                    cellWidth: 60,
                    cellHeight: 60,
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
