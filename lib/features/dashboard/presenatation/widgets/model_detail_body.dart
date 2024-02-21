import 'package:flutter/material.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/dashboard/presenatation/data/models/ml_data_models.dart';

class ModelDetailBody extends StatelessWidget {
  const ModelDetailBody({super.key, required this.data});
  final MLDataModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: data.title,
      ),
    );
  }
}
