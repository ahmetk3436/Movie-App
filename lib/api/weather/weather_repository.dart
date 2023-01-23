import 'package:movie_app/api/weather/weather_model.dart';
import 'package:movie_app/api/weather/weather_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<WeatherModel> fetchWeatherData() {
    return _provider.fetchWeatherData();
  }
}

class NetworkError extends Error {}
