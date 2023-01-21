import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';

import 'package:get/get.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/data/providers/weather_provider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            WeatherBg(
              weatherType: WeatherType.cloudy,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            FutureBuilder<Weather?>(
              future: WeatherApiClient(httpClient: Dio()).getWeather(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("You got the data");
                } else {
                  return Center(
                      child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 120,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Text("Getting data..."),
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
