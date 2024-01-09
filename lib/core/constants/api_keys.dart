class ApiKeys {
  //base url
  static const String weatherBaseUrl = "https://weatherapi-com.p.rapidapi.com/";

  //endpoints
  static const String forcastweatherEndPoint = "forecast.json";
  static const String currentWeatherEndPoint = "current.json";

  //headers
  static const Map<String, String> defaultHeader = {
    'X-RapidAPI-Key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55',
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
  };
}
