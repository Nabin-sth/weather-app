import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import '../models/weather_current_data.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      temperatureAreaWidget(),
      const SizedBox(height: 20),
      moredetailsWidget(),
    ]);
  }

  Widget temperatureAreaWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          Image.asset(
            'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
            height: 85,
            width: 85,
          ),
          Text(
              "${weatherDataCurrent.current.weather![0].description}"
                  .toUpperCase(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
        ],
      ),
      Container(
        color: CustomColors.dividerLine,
        height: 50,
        width: 1,
      ),
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "${weatherDataCurrent.current.temp!.toInt()}°C",
            style: const TextStyle(
                fontSize: 70,
                color: Colors.black,
                fontWeight: FontWeight.w300)),
      ]))
    ]);
  }

  Widget moredetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                'assets/icons/windspeed.png',
                height: 40,
                width: 40,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                'assets/icons/clouds.png',
                height: 40,
                width: 40,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                'assets/icons/humidity.png',
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 80,
              child: Text(
                "${weatherDataCurrent.current.windSpeed}km/hr",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 80,
              child: Text(
                '${weatherDataCurrent.current.clouds}%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 80,
              child: Text(
                '${weatherDataCurrent.current.humidity}%',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
