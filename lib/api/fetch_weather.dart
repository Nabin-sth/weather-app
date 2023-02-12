import 'dart:convert';

import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/models/weather_hourly_data.dart';

import '../models/weather_data.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';

class FetchWeatherapi {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );

    return weatherData!;
  }
}

String apiUrl(var lat, var lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$api&units=metric&exculde=minutely";
  return url;
}
