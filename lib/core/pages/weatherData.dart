// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/bloc/weather/bloc.dart';
import 'package:movie_app/bloc/weather/state.dart';
import 'package:movie_app/core/widgets/fl_chart.dart';

class WeatherData extends StatefulWidget {
  const WeatherData({
    Key? key,
    required this.weatherBloc,
  }) : super(key: key);
  final WeatherBloc weatherBloc;
  @override
  State<WeatherData> createState() => _WeatherDataState();
}

class _WeatherDataState extends State<WeatherData> {
  @override
  Widget build(BuildContext context) {
    return _buildWeatherData(widget.weatherBloc);
  }

  Widget _buildWeatherData(WeatherBloc weatherBloc) {
    return BlocProvider<WeatherBloc>(
      create: (_) => weatherBloc,
      child: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              print("initial");
              return const BuildLoadingWidget();
            } else if (state is WeatherLoading) {
              print("loading");
              return const BuildLoadingWidget();
            } else if (state is WeatherLoaded) {
              print(state.weatherModel.hourly!.temperature2m!.length);
              return FLChartWidget(
                state: state.weatherModel,
              );
            } else if (state is WeatherError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
