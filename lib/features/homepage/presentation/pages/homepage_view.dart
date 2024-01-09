import 'package:flutter/material.dart';
import 'package:gahurakshak/features/homepage/presentation/widgets/homepage_body.dart';
import 'package:gahurakshak/features/location/data/fetch_loaction.dart';
import 'package:gahurakshak/features/weather/data/repositories/fetch_weather_data_repo.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FetchCurrentLocation(),
        ),
        ChangeNotifierProvider(create: (context) => FetchWeatherDataRepo()),
      ],
      child: const HomePageBody(),
    );
  }
}
