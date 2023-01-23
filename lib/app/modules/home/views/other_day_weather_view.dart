import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/modules/home/controllers/home_controller.dart';

class OtherDayWeatherView extends GetView<HomeController> {
  Weather weather;
  OtherDayWeatherView({Key? key, required this.weather}) : super(key: key);
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(14),
                child: Text(
                  "Weather Next Day",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  weather.daily!.weathercode!.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          controller
                              .weatherIcon(weather.daily!.weathercode![index]),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${weather.daily!.temperature2mMax![index]}${weather.dailyUnits!.temperature2mMax}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${DateTime.parse(weather.daily!.time![index]).weekday}",
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
