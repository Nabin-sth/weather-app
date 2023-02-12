import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/weather_current_data.dart';

import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class Comfortwidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const Comfortwidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Comfort Level',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 180,
            child: Column(
              children: [
                Center(
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        infoProperties:
                            InfoProperties(bottomLabelText: 'Humidity'),
                        size: 140,
                        animationEnabled: true,
                        customColors: CustomSliderColors(progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor,
                        ])),
                    min: 0,
                    max: 100,
                    initialValue:
                        weatherDataCurrent.current.humidity!.toDouble(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Feels like:${weatherDataCurrent.current.feelsLike}'),
                    Text('UV Index:${weatherDataCurrent.current.uvi}'),
                  ],
                )
              ],
            ),
          )
        ]);
  }
}
