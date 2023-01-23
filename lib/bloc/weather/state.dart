import 'package:equatable/equatable.dart';

import '../../api/weather/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;
  const WeatherLoaded(this.weatherModel);
}

class WeatherError extends WeatherState {
  final String? message;
  const WeatherError(this.message);
}
