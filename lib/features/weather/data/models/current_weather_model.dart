import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

class WeatherModel {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );
}

class Current {
  final String lastUpdated;
  final num tempC;
  final num isDay;
  final double windKph;
  final num windDegree;
  final String windDir;
  final num pressureMb;
  final double pressureIn;
  final num precipMm;
  final num precipIn;
  final num humidity;
  final num cloud;
  final double feelslikeC;
  final num visKm;
  final num visMiles;
  final num uv;
  final num gustKph;
  final Condition condition;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustKph,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json["last_updated"] ?? "",
        tempC: json["temp_c"] ?? 0,
        isDay: json["is_day"] ?? 0,
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"] ?? 0,
        windDir: json["wind_dir"] ?? "",
        pressureMb: json["pressure_mb"] ?? 0,
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"] ?? 0,
        precipIn: json["precip_in"] ?? 0,
        humidity: json["humidity"] ?? 0,
        cloud: json["cloud"] ?? 0,
        feelslikeC: json["feelslike_c"]?.toDouble(),
        visKm: json["vis_km"] ?? 0,
        visMiles: json["vis_miles"] ?? 0,
        uv: json["uv"] ?? 0,
        gustKph: json["gust_kph"] ?? 0,
        condition: Condition.fromJson(json["condition"]),
      );
}

class Forecast {
  final List<Forecastday> forecastday;

  Forecast({
    required this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );
}

class Forecastday {
  final DateTime date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  Forecastday({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
      );
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final num moonIllumination;
  final num isMoonUp;
  final num isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );
}

class Day {
  final double maxtempC;
  final double mintempC;
  final double avgtempC;
  final double maxwindKph;
  final num totalprecipMm;
  final num totalprecipIn;
  final num totalsnowCm;
  final num avgvisKm;
  final num avgvisMiles;
  final num avghumidity;
  final num dailyWillItRain;
  final num dailyChanceOfRain;
  final num dailyWillItSnow;
  final num dailyChanceOfSnow;
  final Condition condition;
  final num uv;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        maxwindKph: json["maxwind_kph"]?.toDouble(),
        totalprecipMm: json["totalprecip_mm"],
        totalprecipIn: json["totalprecip_in"],
        totalsnowCm: json["totalsnow_cm"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );
}

class Condition {
  final String text;
  final String icon;
  final num code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}

class Hour {
  final String time;
  final num tempC;
  final num isDay;
  final Condition condition;
  final num windMph;
  final double windKph;
  final num windDegree;
  final String windDir;
  final num pressureMb;
  final double pressureIn;
  final num precipMm;
  final num precipIn;
  final num snowCm;
  final num humidity;
  final num cloud;
  final num feelslikeC;
  final num windchillC;
  final num heatindexC;
  final double dewpointC;
  final num willItRain;
  final num chanceOfRain;
  final num willItSnow;
  final num chanceOfSnow;
  final num visKm;
  final num visMiles;
  final double gustMph;
  final double gustKph;
  final num uv;

  Hour({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.windchillC,
    required this.heatindexC,
    required this.dewpointC,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        time: json["time"],
        tempC: json["temp_c"],
        isDay: json["is_day"],
        condition: Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"],
        windKph: json["wind_kph"]?.toDouble(),
        windDegree: json["wind_degree"],
        windDir: json["wind_dir"],
        pressureMb: json["pressure_mb"],
        pressureIn: json["pressure_in"]?.toDouble(),
        precipMm: json["precip_mm"],
        precipIn: json["precip_in"],
        snowCm: json["snow_cm"],
        humidity: json["humidity"],
        cloud: json["cloud"],
        feelslikeC: json["feelslike_c"],
        windchillC: json["windchill_c"],
        heatindexC: json["heatindex_c"],
        dewpointC: json["dewpoint_c"]?.toDouble(),
        willItRain: json["will_it_rain"],
        chanceOfRain: json["chance_of_rain"],
        willItSnow: json["will_it_snow"],
        chanceOfSnow: json["chance_of_snow"],
        visKm: json["vis_km"],
        visMiles: json["vis_miles"],
        gustMph: json["gust_mph"]?.toDouble(),
        gustKph: json["gust_kph"]?.toDouble(),
        uv: json["uv"],
      );
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final num localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
      );
}
