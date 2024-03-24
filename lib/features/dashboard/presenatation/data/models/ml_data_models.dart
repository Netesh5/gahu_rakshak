// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_heatmap/fl_heatmap.dart';
import 'package:gahurakshak/core/enum/charts_type_enums.dart';

class MLDataModel {
  String title;
  List<Map<String, List<EchopsWithAccuracyModel>>> lineChartmodelData;
  List<HeatmapItem> confusionMatrixModeldata;
  String chartTitle;
  String? label1;
  String? label2;
  String? label3;
  String? label4;
  ChartType chartType;
  String? confusionMatrixTitle;
  MLDataModel({
    required this.title,
    required this.lineChartmodelData,
    required this.chartTitle,
    this.label1,
    this.label2,
    this.label3,
    this.label4,
    required this.chartType,
    required this.confusionMatrixModeldata,
    this.confusionMatrixTitle,
  });
}

class EchopsWithAccuracyModel {
  int echops;
  double accuracy;
  EchopsWithAccuracyModel({
    required this.echops,
    required this.accuracy,
  });
}

class ConfusionMatrix {
  int tp;
  int tn;
  int fp;
  int fn;
  ConfusionMatrix({
    required this.tp,
    required this.tn,
    required this.fp,
    required this.fn,
  });
}
