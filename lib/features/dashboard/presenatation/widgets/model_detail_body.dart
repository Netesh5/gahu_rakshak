import 'package:fl_heatmap/fl_heatmap.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/enum/charts_type_enums.dart';
import 'package:gahurakshak/core/extension/capitalize.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ModelDetailBody extends StatelessWidget {
  ModelDetailBody({super.key, required this.data});
  final MLDataModel data;
  final List<String> columns = ["Postivite", "Negative"];
  final List<String> rows = ["Postivite", "Negative"];
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
              if (data.chartType == ChartType.lineChart)
                SfCartesianChart(
                  title: ChartTitle(
                    text: data.chartTitle,
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
                      name: data.label1?.capitalize() ?? "",
                      animationDuration: 3000,
                      color: AppColors.goldenColor,
                      dataSource: data.lineChartmodelData[index][data.label1],
                      xValueMapper: (EchopsWithAccuracyModel model, _) =>
                          double.parse(model.echops.toString()),
                      yValueMapper: (EchopsWithAccuracyModel model, _) =>
                          model.accuracy,
                    ),
                    LineSeries<EchopsWithAccuracyModel, double>(
                      name: data.label2?.capitalize() ?? "",
                      animationDuration: 3000,
                      color: AppColors.white,
                      dataSource: data.lineChartmodelData[index][data.label2],
                      xValueMapper: (EchopsWithAccuracyModel model, _) =>
                          double.parse(model.echops.toString()),
                      yValueMapper: (EchopsWithAccuracyModel model, _) =>
                          model.accuracy,
                    ),
                  ],
                ),
              if (data.confusionMatrixModeldata != null)
                Column(
                  children: [
                    SizedBox(
                      height: 20.hp,
                    ),
                    Text(
                      data.confusionMatrixTitle ?? "",
                      style: appTextTheme.bodyLargeSemiBold
                          .copyWith(fontSize: 20.wp),
                    ),
                    Heatmap(
                      heatmapData: HeatmapData(
                        columns: columns,
                        rows: rows,
                        items: [
                          data.confusionMatrixModeldata?[0] ??
                              const HeatmapItem(
                                value: 0,
                              ),
                          data.confusionMatrixModeldata?[1] ??
                              const HeatmapItem(value: 0),
                          data.confusionMatrixModeldata?[2] ??
                              const HeatmapItem(value: 0),
                          data.confusionMatrixModeldata?[3] ??
                              const HeatmapItem(value: 0),
                        ],
                      ),
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
        itemCount: data.lineChartmodelData.length,
      ),
    );
  }
}
