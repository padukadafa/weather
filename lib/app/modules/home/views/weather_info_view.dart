import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/modules/home/controllers/home_controller.dart';

class WeatherInfoView extends GetView<HomeController> {
  Weather weather;
  WeatherInfoView({Key? key, required this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Hourly data = weather.hourly!;
    HourlyUnits units = weather.hourlyUnits!;
    int currentIndex = controller.currentIndex.value;
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
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.thermostat,
              color: Colors.white,
            ),
            title: Text(
              "Temperature",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.temperature2m![currentIndex]} ${units.temperature2m}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.wind_power,
              color: Colors.white,
            ),
            title: Text(
              "Wind Speed",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.windspeed10m![currentIndex]} ${units.windspeed10m}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.water_drop,
              color: Colors.white,
            ),
            title: Text(
              "Soil Moisture",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.soilMoisture01cm![currentIndex]} ${units.soilMoisture01cm}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
            title: Text(
              "Visibility",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.visibility![currentIndex]} ${units.visibility}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.thermostat,
              color: Colors.white,
            ),
            title: Text(
              "Pressure",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.surfacePressure![currentIndex]} ${units.surfacePressure}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.cloud,
              color: Colors.white,
            ),
            title: Text(
              "Cloud",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "${data.cloudcover![currentIndex]} ${units.cloudcover}",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
