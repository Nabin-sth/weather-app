import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';

import '../models/weather_data.dart';

class Globalcontroller extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getlatitude() => _latitude;
  RxDouble getlongitude() => _longitude;

  final weatherData = WeatherData().obs;
  WeatherData getData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    bool isserviceenabled;
    LocationPermission permission;

    isserviceenabled = await Geolocator.isLocationServiceEnabled();

    if (!isserviceenabled) {
      return Future.error('not enabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      return Future.error('deniedForever');
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;
      return FetchWeatherapi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;

        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
