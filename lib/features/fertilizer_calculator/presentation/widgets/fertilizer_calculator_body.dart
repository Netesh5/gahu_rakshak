import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/enum/unit_enum.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/form_validator.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_round_button.dart';
import 'package:gahurakshak/core/widgets/buttons/custom_text_fields.dart';

import 'package:gahurakshak/features/fertilizer_calculator/data/repository/calculate_fertilizer.dart';
import 'package:gahurakshak/features/fertilizer_calculator/presentation/widgets/fetilizer_result_widget.dart';
import 'package:provider/provider.dart';

class FertilizerCalculatorBody extends StatefulWidget {
  const FertilizerCalculatorBody({super.key});

  @override
  State<FertilizerCalculatorBody> createState() =>
      _FertilizerCalculatorBodyState();
}

class _FertilizerCalculatorBodyState extends State<FertilizerCalculatorBody> {
  final nController = TextEditingController(text: "60");

  final pController = TextEditingController(text: "30");

  final kController = TextEditingController(text: "30");

  final plotController = TextEditingController();

  Unit unit = Unit.bigha;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.fertilizerCalculator.tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.wp),
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.nutrientQty.tr(),
                  style: appTextTheme.bodyLargeSemiBold,
                ),
                SizedBox(
                  height: 20.hp,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: nController,
                        label: LocaleKeys.n.tr(),
                        hintText: LocaleKeys.n.tr(),
                        isRequired: true,
                        validator: (value) {
                          return FormValidator.validateFieldNotEmpty(
                            value,
                            LocaleKeys.n.tr(),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: pController,
                        label: LocaleKeys.p.tr(),
                        hintText: LocaleKeys.p.tr(),
                        isRequired: true,
                        validator: (value) {
                          return FormValidator.validateFieldNotEmpty(
                            value,
                            LocaleKeys.p.tr(),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: kController,
                        label: LocaleKeys.k.tr(),
                        hintText: LocaleKeys.k.tr(),
                        isRequired: true,
                        validator: (value) {
                          return FormValidator.validateFieldNotEmpty(
                            value,
                            LocaleKeys.k.tr(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.hp,
                ),
                Text(
                  LocaleKeys.unit.tr(),
                  style: appTextTheme.bodyLargeSemiBold,
                ),
                SizedBox(
                  height: 20.hp,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          LocaleKeys.bigha.tr(),
                          style: appTextTheme.bodyLargeSemiBold,
                        ),
                        activeColor: AppColors.goldenColor,
                        value: Unit.bigha,
                        groupValue: unit,
                        onChanged: (Unit? value) {
                          unit = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          LocaleKeys.ropani.tr(),
                          style: appTextTheme.bodyLargeSemiBold,
                        ),
                        activeColor: AppColors.goldenColor,
                        value: Unit.ropani,
                        groupValue: unit,
                        onChanged: (Unit? value) {
                          unit = value!;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile.adaptive(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          LocaleKeys.anna.tr(),
                          style: appTextTheme.bodyLargeSemiBold,
                        ),
                        activeColor: AppColors.goldenColor,
                        value: Unit.anna,
                        groupValue: unit,
                        onChanged: (Unit? value) {
                          unit = value!;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.hp,
                ),
                Text(
                  LocaleKeys.plotSize.tr(),
                  style: appTextTheme.bodyLargeSemiBold,
                ),
                SizedBox(
                  height: 20.hp,
                ),
                CustomTextField(
                  leftPadding: 0,
                  rightPadding: 0,
                  controller: plotController,
                  label: "",
                  hintText: LocaleKeys.plotSize.tr(),
                  isRequired: true,
                  validator: (value) {
                    return FormValidator.validateFieldNotEmpty(
                      value,
                      LocaleKeys.plotSize.tr(),
                    );
                  },
                ),
                SizedBox(
                  height: 20.hp,
                ),
                CustomRoundedButtom(
                  color: AppColors.goldenColor,
                  title: LocaleKeys.calculate.tr(),
                  textColor: AppColors.black,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<CalculateFertilizer>().calculateFertilizer(
                            unit: unit.name,
                            nitrogenValue: nController.text,
                            phosphorusValue: pController.text,
                            potassiumValue: kController.text,
                            plotSize: plotController.text,
                          );
                    }
                  },
                ),
                Consumer<CalculateFertilizer>(builder: (context, value, child) {
                  if (value.kValue > 0.0) {
                    return const FertilizerResultWidget();
                  } else {
                    return const SizedBox();
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
