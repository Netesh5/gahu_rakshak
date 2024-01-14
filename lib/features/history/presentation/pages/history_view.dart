import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/features/history/data/repository/fetch_result_detail.dart';
import 'package:gahurakshak/features/history/presentation/widgets/history_body.dart';

import 'package:provider/provider.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HistoryBody();
  }
}
