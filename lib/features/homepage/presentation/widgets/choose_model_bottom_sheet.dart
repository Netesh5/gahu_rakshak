// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/bottom_sheets/custom_bottom_sheet_wrapper.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/enum/model_enums.dart';
import 'package:gahurakshak/core/routes/routes.dart';

import 'package:gahurakshak/core/services/result_service.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/loading/loading_dialog.dart';
import 'package:gahurakshak/features/homepage/data/repositories/upload_analyze_data_repo.dart';
import 'package:gahurakshak/features/tflite_model/wheat_disease_tfmodel.dart';

showChooseModelBottomSheet(BuildContext context, String path, String value,
    UploadAnalyzeDataRepo uploadAnalyzeDataRepo) {
  showModalBottomSheet(
    backgroundColor: AppColors.backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (context) => ChooseModelBottomSheet(
      uploadAnalyzeDataRepo: uploadAnalyzeDataRepo,
      path: path,
      value: value,
    ),
  );
}

class ChooseModelBottomSheet extends StatefulWidget {
  const ChooseModelBottomSheet(
      {super.key,
      required this.uploadAnalyzeDataRepo,
      required this.path,
      required this.value});
  final UploadAnalyzeDataRepo uploadAnalyzeDataRepo;
  final String path;
  final String value;
  @override
  State<ChooseModelBottomSheet> createState() => _ChooseModelBottomSheetState();
}

class _ChooseModelBottomSheetState extends State<ChooseModelBottomSheet> {
  Model model = Model.vgg;

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return BottomSheetWrapper(
        title: LocaleKeys.chooseAOption.tr(),
        child: Column(
          children: [
            RadioListTile.adaptive(
              fillColor: const MaterialStatePropertyAll(AppColors.goldenColor),
              value: Model.vgg,
              groupValue: model,
              onChanged: (val) {
                model = val!;
                setState(() {});
              },
              title: Text(
                LocaleKeys.vgg.tr(),
                style: appTextTheme.bodyLargeMedium,
              ),
            ),
            RadioListTile.adaptive(
              fillColor: const MaterialStatePropertyAll(AppColors.goldenColor),
              value: Model.cnn,
              groupValue: model,
              onChanged: (val) {
                model = val!;
                setState(() {});
              },
              title: Text(
                LocaleKeys.cnn.tr(),
                style: appTextTheme.bodyLargeMedium,
              ),
            ),
            SizedBox(
              height: 40.hp,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomRoundedButtom(
                title: "Continue",
                color: AppColors.goldenColor,
                textColor: AppColors.black,
                onPressed: () async {
                  if (model == Model.vgg) {
                    showLoadingDialog(context, true);
                    final output = await WheatDieseaseTFModel()
                        .makePredictions(widget.path);

                    await widget.uploadAnalyzeDataRepo.uploadAnalyzeData(
                      context: context,
                      param: checkResult(output, widget.value),
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(
                      Routes.result,
                      arguments: checkResult(output, widget.value),
                    );
                  } else {
                    showLoadingDialog(context, true);
                    final output = await WheatDieseaseTFModel()
                        .makeCNNPredictions(widget.path);

                    await widget.uploadAnalyzeDataRepo.uploadAnalyzeData(
                      context: context,
                      param: checkResult(output, widget.value),
                    );
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed(
                      Routes.result,
                      arguments: checkResult(output, widget.value),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
