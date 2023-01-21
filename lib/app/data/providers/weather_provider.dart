import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/app/data/models/weather_model.dart';

const baseUrl =
    'https://api.open-meteo.com/v1/forecast?latitude=-6.18&longitude=106.82&daily=weathercode,apparent_temperature_max,apparent_temperature_min,sunrise,sunset&timeformat=unixtime&timezone=Asia%2FSingapore';

class WeatherApiClient {
  final Dio httpClient;
  WeatherApiClient({required this.httpClient});

  Future<Weather?> getWeather() async {
    try {
      final response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else
        print('erro -get');
    } catch (e) {
      print(e);
    }
  }
}
