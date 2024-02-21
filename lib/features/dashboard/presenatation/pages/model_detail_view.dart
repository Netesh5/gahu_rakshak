import 'package:flutter/material.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';
import 'package:gahurakshak/features/dashboard/presenatation/widgets/model_detail_body.dart';

class ModelDetailView extends StatelessWidget {
  const ModelDetailView({super.key, required this.dataModel});
  final MLDataModel dataModel;
  @override
  Widget build(BuildContext context) {
    return ModelDetailBody(
      data: dataModel,
    );
  }
}
