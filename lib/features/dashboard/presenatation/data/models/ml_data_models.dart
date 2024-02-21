// ignore_for_file: public_member_api_docs, sort_constructors_first
class MLDataModel {
  String title;
  List<EchopsWithAccuracyModel> modelData;
  String chartTitle;
  MLDataModel({
    required this.title,
    required this.modelData,
    required this.chartTitle,
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
