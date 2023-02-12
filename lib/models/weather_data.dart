import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/models/weather_hourly_data.dart';

import 'weather_current_data.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;

  WeatherDataDaily getDailyWeather() => daily!;
}
