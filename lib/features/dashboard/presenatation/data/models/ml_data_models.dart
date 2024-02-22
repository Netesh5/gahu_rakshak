// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gahurakshak/core/enum/charts_type_enums.dart';

class MLDataModel {
  String title;
  List<Map<String, List<EchopsWithAccuracyModel>>> modelData;
  String chartTitle;
  String? label1;
  String? label2;
  String? label3;
  String? label4;
  ChartType chartType;
  MLDataModel({
    required this.title,
    required this.modelData,
    required this.chartTitle,
    this.label1,
    this.label2,
    this.label3,
    this.label4,
    required this.chartType,
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
