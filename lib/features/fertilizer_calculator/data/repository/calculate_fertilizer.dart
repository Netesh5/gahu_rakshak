import 'package:flutter/material.dart';

class CalculateFertilizer with ChangeNotifier {
  num nValue = 0.0;
  num pValue = 0.0;
  num kValue = 0.0;
  calculateFertilizer({
    required String unit,
    required String nitrogenValue,
    required String phosphorusValue,
    required String potassiumValue,
  }) {
    switch (unit) {
      case "bigha":
        nValue = (num.parse(nitrogenValue) / 46) * 100 * 3.95;
        pValue = (num.parse(phosphorusValue) / 16) * 100 * 3.95;
        kValue = (num.parse(potassiumValue) / 60) * 100 * 3.95;
        notifyListeners();
        return;
      case "ropani":
        nValue = (num.parse(nitrogenValue) / 46) * 100 * 19.65;
        pValue = (num.parse(phosphorusValue) / 16) * 100 * 19.65;
        kValue = (num.parse(potassiumValue) / 60) * 100 * 19.65;
        notifyListeners();
        return;
      case "anna":
        nValue = (num.parse(nitrogenValue) / 46) * 100 * 2;
        pValue = (num.parse(phosphorusValue) / 16) * 100 * 2;
        kValue = (num.parse(potassiumValue) / 60) * 100 * 2;
        notifyListeners();
        return;
    }
  }
}
