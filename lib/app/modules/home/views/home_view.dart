import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';

import 'package:get/get.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/data/providers/weather_provider.dart';
import 'package:weather/app/modules/home/views/current_weather_view.dart';
import 'package:weather/app/modules/home/views/loading_view.dart';
import 'package:weather/app/modules/home/views/other_day_weather_view.dart';
import 'package:weather/app/modules/home/views/weather_info_view.dart';
import 'package:weather/app/modules/home/views/weather_today_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              return WeatherBg(
                weatherType: controller.weatherType.value,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              );
            }),
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Container(),
              ),
            ),
            Obx(() {
              return (controller.weather.value != null)
                  ? SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 50),
                            CurrentWeatherView(
                                weather: controller.weather.value!),
                            SizedBox(height: 20),
                            WeatherTodayView(
                              weather: controller.weather.value!,
                            ),
                            SizedBox(height: 20),
                            WeatherInfoView(weather: controller.weather.value!),
                            SizedBox(height: 20),
                            OtherDayWeatherView(
                                weather: controller.weather.value!),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    )
                  : Center(child: LoadingView());
            })
          ],
        ),
      ),
    );
  }
}
