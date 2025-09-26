import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(
                    context,
                  ).weatherModel?.weatherCondition,
                ),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange; // MaterialColor
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
      return Colors.grey; // MaterialColor

    case "Mist":
    case "Fog":
      return Colors.blueGrey; // MaterialColor

    case "Patchy rain":
    case "Light rain":
    case "Moderate rain":
      return Colors.lightBlue; // MaterialColor

    case "Heavy rain":
    case "Torrential rain":
      return Colors.blue; // MaterialColor

    case "Patchy snow":
    case "Light snow":
      return Colors.cyan; // MaterialColor

    case "Moderate snow":
    case "Heavy snow":
      return Colors.indigo; // MaterialColor

    case "Sleet":
    case "Freezing drizzle":
    case "Freezing rain":
      return Colors.blue; // MaterialColor

    case "Thundery":
    case "Thunder":
      return Colors.deepPurple; // MaterialColor
    case "Ice pellets":
      return Colors.teal; // MaterialColor
    default:
      return Colors.grey; // Default MaterialColor
  }
}

// MaterialColor getThemeColor(String? condition) {
//   // ☀️ مشمس/صافٍ
//   const sunnyConditions = ["Sunny", "Clear"];

//   // ☁️ غائم
//   const cloudyConditions = ["Partly cloudy", "Cloudy", "Overcast"];

//   // 🌫 ضباب
//   const fogConditions = ["Mist", "Fog", "Freezing fog"];

//   // 🌧 أمطار
//   const rainConditions = [
//     "Patchy rain possible",
//     "Patchy light drizzle",
//     "Light drizzle",
//     "Patchy light rain",
//     "Light rain",
//     "Moderate rain at times",
//     "Moderate rain",
//     "Heavy rain at times",
//     "Heavy rain",
//     "Light rain shower",
//     "Moderate or heavy rain shower",
//     "Torrential rain shower",
//     "Light freezing rain",
//     "Moderate or heavy freezing rain",
//     "Freezing drizzle",
//     "Heavy freezing drizzle",
//   ];

//   // ❄️ ثلوج
//   const snowConditions = [
//     "Patchy snow possible",
//     "Patchy light snow",
//     "Light snow",
//     "Patchy moderate snow",
//     "Moderate snow",
//     "Patchy heavy snow",
//     "Heavy snow",
//     "Light snow showers",
//     "Moderate or heavy snow showers",
//     "Blowing snow",
//     "Blizzard",
//   ];

//   // 🌨 جليد/برد (sleet + ice pellets)
//   const iceConditions = [
//     "Patchy sleet possible",
//     "Light sleet",
//     "Moderate or heavy sleet",
//     "Light sleet showers",
//     "Moderate or heavy sleet showers",
//     "Ice pellets",
//     "Light showers of ice pellets",
//     "Moderate or heavy showers of ice pellets",
//   ];

//   // ⛈ رعد وبرق
//   const thunderConditions = [
//     "Thundery outbreaks possible",
//     "Patchy light rain with thunder",
//     "Moderate or heavy rain with thunder",
//     "Patchy light snow with thunder",
//     "Moderate or heavy snow with thunder",
//   ];
//   if (condition == null) {
//     return Colors.blueGrey;
//   }
//   // ✅ نحدد اللون حسب المجموعات
//   if (sunnyConditions.contains(condition)) {
//     return Colors.orange;
//   } else if (cloudyConditions.contains(condition)) {
//     return Colors.blueGrey;
//   } else if (fogConditions.contains(condition)) {
//     return Colors.grey;
//   } else if (rainConditions.contains(condition)) {
//     return Colors.indigo;
//   } else if (snowConditions.contains(condition)) {
//     return Colors.lightBlue;
//   } else if (iceConditions.contains(condition)) {
//     return Colors.cyan;
//   } else if (thunderConditions.contains(condition)) {
//     return Colors.deepPurple;
//   }

//   // 🎨 لون افتراضي
//   return Colors.blueGrey;
// }
