import 'package:flutter/material.dart';
import 'package:gahurakshak/features/pets_diseases/data/models/disease_detail_param.dart';
import 'package:gahurakshak/features/pets_diseases/presentation/widgets/disease_detail_body.dart';

class DiseaseDetailView extends StatelessWidget {
  const DiseaseDetailView({super.key, required this.param});
  final DiseaseDetailParam param;
  @override
  Widget build(BuildContext context) {
    return DiseaseDetailBody(
      param: param,
    );
  }
}
