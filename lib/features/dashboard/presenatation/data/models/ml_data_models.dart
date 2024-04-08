class MLDataModel {
  String title;
  Map<String, List<EchopsWithAccuracyModel>> lineChartmodelData;
  String chartTitle;
  String? label1;
  String? label2;

  MLDataModel({
    required this.title,
    required this.lineChartmodelData,
    required this.chartTitle,
    this.label1,
    this.label2,
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
