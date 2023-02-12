import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyDataWidget extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataWidget({super.key, required this.weatherDataDaily});

  String getday(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final y = DateFormat('EEE').format(time);
    return y;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 380,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                'Next Days',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            dailyList(),
          ],
        ));
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: weatherDataDaily.daily.length > 7
            ? 7
            : weatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 60,
                    child: Text(getday(weatherDataDaily.daily[index].dt))),
                SizedBox(
                  height: 60,
                  width: 40,
                  child: Image.asset(
                      'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png'),
                ),
                Text(
                    '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°')
              ],
            ),
            Container(
              height: 1,
              color: CustomColors.dividerLine,
            )
          ]);
        },
      ),
    );
  }
}
