import 'package:flutter/material.dart';
import 'package:gahurakshak/features/history/presentation/widgets/history_detail_body.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';

class HistoryDetailView extends StatelessWidget {
  const HistoryDetailView({super.key, required this.param});
  final ResultModel param;
  @override
  Widget build(BuildContext context) {
    return HistoryDetailBody(
      model: param,
    );
  }
}
