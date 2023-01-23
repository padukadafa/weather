import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/app/data/models/weather_model.dart';

class WeatherApiClient {
  final Dio httpClient;
  WeatherApiClient({required this.httpClient});

  Future<Weather?> getWeather(Position pos) async {
    print("${pos.latitude},${pos.longitude}");
    String baseUrl =
        'https://api.open-meteo.com/v1/forecast?latitude=${pos.latitude}&longitude=${pos.longitude}&hourly=temperature_2m,relativehumidity_2m,apparent_temperature,precipitation,weathercode,surface_pressure,cloudcover,visibility,windspeed_10m,soil_moisture_0_1cm&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=GMT';
    try {
      final response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else
        print('erro -get');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
