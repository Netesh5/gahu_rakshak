import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/api_keys.dart';
import 'package:gahurakshak/features/weather/data/models/current_weather_model.dart';
import 'package:gahurakshak/features/weather/data/models/location_param.dart';

class FetchWeatherDataRepo with ChangeNotifier {
  final Dio dio = Dio();
  Future<WeatherModel> fetchWeatherData(LocationParam param) async {
    try {
      final res = await dio.get(
        "${ApiKeys.weatherBaseUrl}${ApiKeys.forcastweatherEndPoint}",
        options: Options(
          headers: ApiKeys.defaultHeader,
        ),
        queryParameters: {"q": "${param.lat},${param.long}", "days": 7},
      );
      notifyListeners();
      return WeatherModel.fromJson(res.data);
    } on DioException {
      rethrow;
    }
  }
}
