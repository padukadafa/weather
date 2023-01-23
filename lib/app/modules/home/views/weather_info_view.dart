import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherInfoView extends GetView {
  const WeatherInfoView({Key? key}) : super(key: key);
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
              "34*",
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
              "20 km/s",
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
              "Humidity",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              "34",
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
              "30 m",
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
              "1.01 atm",
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
              "60%",
              style: GoogleFonts.lato(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
