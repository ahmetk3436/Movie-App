import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/weather/weather_model.dart';

class FLChartWidget extends StatefulWidget {
  const FLChartWidget({super.key, required this.state});
  final WeatherModel state;
  @override
  State<FLChartWidget> createState() => _FLChartWidgetState();
}

class _FLChartWidgetState extends State<FLChartWidget> {
  @override
  Widget build(BuildContext context) {
    return ChartBuilder(widget.state);
  }
}

Stack ChartBuilder(WeatherModel state) {
  return Stack(
    children: <Widget>[
      AspectRatio(
        aspectRatio: 1.70,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
            color: Color(0xff232d37),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData(state)),
          ),
        ),
      ),
    ],
  );
}

LineChartData mainData(WeatherModel state) {
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          reservedSize: 42,
        ),
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d)),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(state.hourly!.temperature2m![0].toDouble(),
              state.hourly!.temperature2m![1].toDouble()),
          FlSpot(state.hourly!.temperature2m![2].toDouble(),
              state.hourly!.temperature2m![3].toDouble()),
          FlSpot(state.hourly!.temperature2m![4].toDouble(),
              state.hourly!.temperature2m![5].toDouble()),
          FlSpot(state.hourly!.temperature2m![6].toDouble(),
              state.hourly!.temperature2m![7].toDouble()),
          FlSpot(state.hourly!.temperature2m![8].toDouble(),
              state.hourly!.temperature2m![9].toDouble()),
          FlSpot(state.hourly!.temperature2m![10].toDouble(),
              state.hourly!.temperature2m![11].toDouble()),
          FlSpot(state.hourly!.temperature2m![12].toDouble(),
              state.hourly!.temperature2m![13].toDouble()),
        ],
        isCurved: true,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
        ),
      ),
    ],
  );
}
