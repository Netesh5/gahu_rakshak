import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/widgets/app_bar/custom_app_bar.dart';
import 'package:gahurakshak/features/location/data/fetch_loaction.dart';
import 'package:gahurakshak/features/weather/data/models/current_weather_model.dart';
import 'package:gahurakshak/features/weather/presentation/widgets/weather_body.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  WeatherModel? weatherModel;
  @override
  initState() {
    fetchLocation();
    super.initState();
  }

  fetchLocation() async {
    await context.read<FetchCurrentLocation>().fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.appName.tr(),
        centerMiddle: true,
        showShadow: true,
      ),
      body: const WeatherWidget(),
    );
  }
}
