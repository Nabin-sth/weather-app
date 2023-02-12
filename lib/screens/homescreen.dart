import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/widgets/comfort_level.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/daiy_data_widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final Globalcontroller globalcontroller =
      Get.put(Globalcontroller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalcontroller.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/clouds.png',
                      height: 200,
                      width: 200,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 10),
                  const Headerwidget(),
                  CurrentWeatherWidget(
                    weatherDataCurrent:
                        globalcontroller.getData().getCurrentWeather(),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(height: 10),
                  HourlyDataWidget(
                    weatherDataHourly:
                        globalcontroller.getData().getHourlyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  DailyDataWidget(
                    weatherDataDaily:
                        globalcontroller.getData().getDailyWeather(),
                  ),
                  Container(
                    height: 1,
                    color: CustomColors.dividerLine,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Comfortwidget(
                      weatherDataCurrent:
                          globalcontroller.getData().getCurrentWeather()),
                ],
              )),
      ),
    );
  }
}
