import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/models/weather_hourly_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  RxInt cardIndex = Globalcontroller().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 2),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Today',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
        height: 150,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherDataHourly.hourly.length > 12
              ? 12
              : weatherDataHourly.hourly.length,
          itemBuilder: (context, index) {
            return Obx((() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: CustomColors.dividerLine,
                        offset: Offset(0.5, 0),
                        blurRadius: 30,
                        spreadRadius: 1,
                      ),
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor
                          ])
                        : null,
                  ),
                  child: HourlyDetails(
                      temp: weatherDataHourly.hourly[index].temp!,
                      day: weatherDataHourly.hourly[index].dt!,
                      weatherIcon:
                          weatherDataHourly.hourly[index].weather![0].icon!),
                ))));
          },
        ));
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int day;
  String weatherIcon;

  String gettime(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('jm').format(date);
    return x;
  }

  HourlyDetails(
      {super.key,
      required this.temp,
      required this.day,
      required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Text(gettime(day))),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/weather/${weatherIcon}.png',
            height: 50,
            width: 50,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text('${temp}°'),
        )
      ],
    );
  }
}
