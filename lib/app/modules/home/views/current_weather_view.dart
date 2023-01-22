import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather/app/data/models/weather_model.dart';

class CurrentWeatherView extends GetView {
  Weather weather;
  CurrentWeatherView({Key? key, required this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff252525).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.4),
        //     blurRadius: 10,
        //   ),
        // ],
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 150,
      child: Column(
        children: [Text("${DateTime.parse("${weather.hourly!.time![0]}")}")],
      ),
    );
  }
}
