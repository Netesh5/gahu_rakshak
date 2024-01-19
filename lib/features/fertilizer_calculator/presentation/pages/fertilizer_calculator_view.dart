import 'package:flutter/material.dart';
import 'package:gahurakshak/features/fertilizer_calculator/data/repository/calculate_fertilizer.dart';
import 'package:gahurakshak/features/fertilizer_calculator/presentation/widgets/fertilizer_calculator_body.dart';
import 'package:provider/provider.dart';

class FertilizerCalculatorView extends StatelessWidget {
  const FertilizerCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculateFertilizer(),
      child: const FertilizerCalculatorBody(),
    );
  }
}
