import 'package:flutter/material.dart';
import 'package:gahurakshak/features/history/presentation/widgets/history_detail_body.dart';

class HistoryDetailView extends StatelessWidget {
  const HistoryDetailView({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return HistoryDetailBody(
      index: index,
    );
  }
}
