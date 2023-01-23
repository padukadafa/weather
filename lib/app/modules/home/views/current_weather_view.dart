import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/modules/home/controllers/home_controller.dart';

class CurrentWeatherView extends GetView<HomeController> {
  Weather weather;
  CurrentWeatherView({Key? key, required this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${controller.placemark.value!.administrativeArea ?? ""}",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${weather.hourly!.temperature2m![controller.currentIndex.value]}",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              TextSpan(
                text: " ${weather.dailyUnits!.temperature2mMax}",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          "${controller.getWeatherName(weather.hourly!.weathercode![controller.currentIndex.value])}",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 6,
              ),
            ],
          ),
        ),
        Text(
          "H:${weather.daily!.temperature2mMax!.first}${weather.dailyUnits!.temperature2mMax} L:${weather.daily!.temperature2mMin!.first}${weather.dailyUnits!.temperature2mMin}",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 6,
              ),
            ],
          ),
        )
      ],
    );
  }
}
