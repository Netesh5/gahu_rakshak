import 'package:flutter/material.dart';
import 'package:gahurakshak/core/injector/injector.dart';
import 'package:gahurakshak/core/services/image_picker_services.dart';
import 'package:gahurakshak/features/result/data/models/result_model.dart';
import 'package:gahurakshak/features/result/presentation/widgets/result_body.dart';
import 'package:provider/provider.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.param});
  final ResultModel param;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImagePickerService(
        uploadImage: DI.instance(),
        uploadAnalyzeDataRepo: DI.instance(),
      ),
      child: ResultBody(param: param),
    );
  }
}
