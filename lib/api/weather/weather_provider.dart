import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/api/weather/weather_model.dart';

import '../../core/constants/constants.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      '${Constants.weather_base_url}v1/forecast?latitude=40.21&longitude=29.04&hourly=temperature_2m&current_weather=true&timezone=auto';

  Future<WeatherModel> fetchWeatherData() async {
    try {
      Response response = await _dio.get(_url);
      return WeatherModel.fromJson(response.data);
    } catch (error) {
      return WeatherModel.withError("Data not found / Connection issue");
    }
  }
}
