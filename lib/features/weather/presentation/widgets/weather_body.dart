import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gahurakshak/core/constants/locale_keys.dart';
import 'package:gahurakshak/core/theme/app_color_theme.dart';

import 'package:gahurakshak/core/theme/app_text_theme.dart';
import 'package:gahurakshak/core/utils/size_utils.dart';
import 'package:gahurakshak/features/location/data/fetch_loaction.dart';
import 'package:gahurakshak/features/weather/data/models/current_weather_model.dart';
import 'package:gahurakshak/features/weather/data/models/location_param.dart';
import 'package:gahurakshak/features/weather/data/repositories/fetch_weather_data_repo.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).extension<AppTextTheme>()!;

    return Consumer<FetchCurrentLocation>(
      builder: (context, location, state) {
        return FutureBuilder<WeatherModel>(
          future: context.read<FetchWeatherDataRepo>().fetchWeatherData(
                LocationParam(
                  lat: location.position?.latitude ?? 0.0,
                  long: location.position?.longitude ?? 0.0,
                ),
              ),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return SizedBox(
                height: 300.hp,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.weather.tr(),
                          style: appTextTheme.bodyLargeSemiBold
                              .copyWith(fontSize: 22.wp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  snapshot.data?.location.name ?? "",
                                  style: appTextTheme.bodyLargeMedium,
                                ),
                                Text(
                                  "${snapshot.data?.current.tempC.ceil().toString() ?? ""} °",
                                  style: appTextTheme.bodyLargeMedium
                                      .copyWith(fontSize: 30.hp),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.network(
                                  "https:${snapshot.data?.current.condition.icon ?? ""}",
                                  width: 40.wp,
                                ),
                                Text(
                                  snapshot.data?.current.condition.text ?? "",
                                  style: appTextTheme.bodyLargeMedium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "H:${snapshot.data?.forecast.forecastday.first.day.maxtempC.ceil().toString() ?? ""}°",
                                      style: appTextTheme.bodyLargeMedium,
                                    ),
                                    SizedBox(
                                      width: 10.hp,
                                    ),
                                    Text(
                                      "L:${snapshot.data?.forecast.forecastday.first.day.mintempC.ceil().toString() ?? ""}°",
                                      style: appTextTheme.bodyLargeMedium,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data?.forecast.forecastday.length,
                              itemBuilder: ((context, index) {
                                final forcastData =
                                    snapshot.data?.forecast.forecastday;
                                final dateString =
                                    forcastData![index].date.toString();
                                final formatter = DateFormat('EE');
                                final weekdayName = formatter
                                    .format(DateTime.parse(dateString));
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          weekdayName,
                                          style: appTextTheme.bodyNormalBold
                                              .copyWith(fontSize: 16.hp),
                                        ),
                                        SizedBox(
                                          width: 20.hp,
                                        ),
                                        Image.network(
                                          "https:${forcastData[index].day.condition.icon}",
                                          width: 40.wp,
                                        ),
                                        SizedBox(
                                          width: 20.hp,
                                        ),
                                        Text(
                                          "${forcastData[index].day.mintempC.ceil()} °",
                                          style: appTextTheme.bodyNormalBold
                                              .copyWith(
                                            fontSize: 16.hp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.hp,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: double.infinity,
                                            height: 5.wp,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    AppColors.backgroundColor,
                                                    AppColors.goldenColor
                                                  ],
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.hp,
                                        ),
                                        Text(
                                          "${forcastData[index].day.maxtempC.ceil()} °",
                                          style: appTextTheme.bodyNormalBold
                                              .copyWith(
                                            fontSize: 16.hp,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              })),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
