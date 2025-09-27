class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temp,
    this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

  String getImage(String weatherCondition) {
    if (weatherCondition == 'Sunny' ||
        weatherCondition == 'Clear' ||
        weatherCondition == 'Partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherCondition == 'Cloudy' ||
        weatherCondition == 'Overcast' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Freezing fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Patchy rain nearby' ||
        weatherCondition == 'Patchy light drizzle' ||
        weatherCondition == 'Light drizzle' ||
        weatherCondition == 'Freezing drizzle' ||
        weatherCondition == 'Heavy freezing drizzle' ||
        weatherCondition == 'Patchy light rain' ||
        weatherCondition == 'Light rain' ||
        weatherCondition == 'Moderate rain at times' ||
        weatherCondition == 'Moderate rain' ||
        weatherCondition == 'Heavy rain at times' ||
        weatherCondition == 'Heavy rain' ||
        weatherCondition == 'Light freezing rain' ||
        weatherCondition == 'Moderate or heavy freezing rain' ||
        weatherCondition == 'Light sleet' ||
        weatherCondition == 'Moderate or heavy sleet' ||
        weatherCondition == 'Light rain shower' ||
        weatherCondition == 'Moderate or heavy rain shower' ||
        weatherCondition == 'Torrential rain shower') {
      return 'assets/images/rainy.png';
    } else if (weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow' ||
        weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy light snow' ||
        weatherCondition == 'Light snow' ||
        weatherCondition == 'Patchy moderate snow' ||
        weatherCondition == 'Moderate snow' ||
        weatherCondition == 'Patchy heavy snow' ||
        weatherCondition == 'Heavy snow' ||
        weatherCondition == 'Ice pellets' ||
        weatherCondition == 'Light sleet showers' ||
        weatherCondition == 'Moderate or heavy sleet showers' ||
        weatherCondition == 'Light snow showers' ||
        weatherCondition == 'Moderate or heavy snow showers' ||
        weatherCondition == 'Light showers of ice pellets' ||
        weatherCondition == 'Moderate or heavy showers of ice pellets') {
      return 'assets/images/snow.png';
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Patchy light rain with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy snow with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png'; // default
    }
  }
  
}
