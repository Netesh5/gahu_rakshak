// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {
  String diseaseName;
  String dateTime;
  String imagePath;
  int? index;
  ResultModel({
    required this.diseaseName,
    required this.dateTime,
    required this.imagePath,
    this.index,
  });

  toMap() {
    return <String, dynamic>{
      "diseaseName": diseaseName,
      "dateTime": dateTime,
      "imagePath": imagePath,
    };
  }
}
