// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {
  String diseaseName;
  String dateTime;
  String imagePath;
  String? description;
  String? recommendation;
  String? medicine;
  List<String>? similarImg;

  int? index;
  ResultModel({
    required this.diseaseName,
    required this.dateTime,
    required this.imagePath,
    this.index,
    this.description,
    this.recommendation,
    this.medicine,
    this.similarImg,
  });

  toMap() {
    return <String, dynamic>{
      "diseaseName": diseaseName,
      "dateTime": dateTime,
      "imagePath": imagePath,
    };
  }
}
