import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/weather/event.dart';
import 'package:movie_app/bloc/weather/state.dart';

import '../../api/weather/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetWeatherList>((event, emit) async {
      try {
        emit(WeatherLoading());
        final mList = await apiRepository.fetchWeatherData();
        emit(WeatherLoaded(mList));
        if (mList.error != null) {
          emit(WeatherError(mList.error));
        }
      } on NetworkError {
        emit(
            const WeatherError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
