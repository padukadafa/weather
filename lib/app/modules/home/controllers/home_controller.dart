import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/app/data/models/weather_model.dart';
import 'package:weather/app/data/providers/weather_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  Dio dio = Dio();
  Rx<Placemark?> placemark = Rx(null);
  Rx<int> currentIndex = Rx(0);
  Rx<WeatherType> weatherType = Rx(WeatherType.sunny);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  getLocation(Position pos) async {
    if (pos != null) {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(pos.latitude, pos.longitude);
      placemark.value = placemarks.first;
      update();
    }
  }

  Future<Weather?> init() async {
    Position pos = await _determinePosition();
    Weather? weather = await WeatherApiClient(httpClient: dio).getWeather(pos);
    await getLocation(pos);
    getCurrentIndex(weather!);

    weatherType.value = getWeatherType(currentIndex.value);
    if (weather != null) {
      return weather;
    }
  }

  getCurrentIndex(Weather weather) {
    currentIndex.value = DateTime.now().hour;
  }

  Widget weatherIcon(int code) {
    final double size = 24;
    final Color baseColor = Colors.white;
    switch (code) {
      case 0:
        return Icon(
          Icons.sunny,
          size: size,
          color: baseColor,
        );
      case 1:
        return Icon(
          Icons.sunny,
          size: size,
          color: baseColor,
        );
      case 2:
        return Icon(
          Icons.cloud,
          size: size,
          color: baseColor,
        );
      case 3:
        return Icon(
          Icons.cloud,
          color: Colors.grey,
          size: size,
        );
      case 45:
        return Icon(
          Icons.foggy,
          size: size,
          color: baseColor,
        );
      case 48:
        return Icon(
          Icons.foggy,
          size: size,
          color: baseColor,
        );
      case 61:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 62:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 63:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 80:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 81:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 82:
        return Icon(
          Icons.cloudy_snowing,
          size: size,
          color: baseColor,
        );
      case 95:
        return Icon(
          Icons.thunderstorm,
          size: size,
          color: baseColor,
        );
      case 96:
        return Icon(
          Icons.thunderstorm,
          size: size,
          color: baseColor,
        );
      case 99:
        return Icon(
          Icons.thunderstorm,
          size: size,
          color: baseColor,
        );
      default:
        return Icon(
          Icons.info,
          size: size,
          color: baseColor,
        );
    }
  }

  getWeatherName(int code) {
    switch (code) {
      case 0:
        return "Clear sky";
      case 1:
        return "Mainly clear";
      case 2:
        return "partly cloudy";
      case 3:
        return "overcast";
      case 45:
        return "Fog";
      case 51:
        return "Drizzle Light";
      case 53:
        return "Drizzle moderate";
      case 55:
        return "Drizzle dense intensity";
      case 56:
        return "Freezing Drizzle Light";
      case 57:
        return "Freezing Drizzle dense intensity";
      case 61:
        return "Rain Slight";
      case 63:
        return "Rain moderate";
      case 65:
        return "Rain heavy intensity";
      case 66:
        return "Freezing Rain Light";
      case 67:
        return "Freezing Rain heavy intensity";
      case 71:
        return "Snow fall Slight";
      case 73:
        return "Snow fall moderate";
      case 75:
        return "Snow fall heavy intensity";
      case 77:
        return "Snow grains";
      case 80:
        return "Rain showers Slight";
      case 81:
        return "Rain showers moderate";
      case 82:
        return "Rain showers violent";
      case 85:
        return "Snow showers slight and heavy";
      case 86:
        return "Snow showers slight and heavy";
      case 95:
        return "Thunderstorm Slight";
      case 96:
        return "Thunderstorm moderate";
      case 99:
        return "Thunderstorm with slight and heavy hail";
      default:
        return "unknown";
    }
  }

  WeatherType getWeatherType(int code) {
    if ([0, 1].contains(code)) {
      return WeatherType.sunny;
    }
    if ([2].contains(code)) {
      return WeatherType.cloudy;
    }
    if ([3].contains(code)) {
      return WeatherType.overcast;
    }
    if ([45, 48].contains(code)) {
      return WeatherType.foggy;
    }
    if ([51, 53, 55, 56, 57].contains(code)) {
      return WeatherType.lightRainy;
    }
    if ([61, 63, 65, 66, 67].contains(code)) {
      return WeatherType.middleRainy;
    }

    if ([71, 73, 75, 77].contains(code)) {
      return WeatherType.middleSnow;
    }
    if ([80, 81, 82, 85, 86].contains(code)) {
      return WeatherType.heavyRainy;
    }
    if ([95, 96, 99].contains(code)) {
      return WeatherType.thunder;
    }

    return WeatherType.sunny;
  }
}
