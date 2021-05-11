import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FrequencyLineChart extends StatefulWidget {
  @override
  _FrequencyLineChartState createState() => _FrequencyLineChartState();
}

class _FrequencyLineChartState extends State<FrequencyLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  List<FlSpot> spots = [];
  double maxX = 10;
  double minY = 0;
  double maxY = 10;

  void addValue(double f) {
    if(spots.length < 101) {
      spots.add(FlSpot(spots.length / 10, f));
      return;
    }
    spots.removeAt(0);
    for(var spot in spots) {

    }
  }

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Padding(
        padding:
            const EdgeInsets.only(right: 0, left: 2.0, top: 24, bottom: 12),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
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
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            return "${(value - 10).toInt()}";
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10 khz';
              case 4:
                return '40 khz';
              case 7:
                return '70 khz';
              case 10:
                return '100 khz';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: maxX - 10,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  String getUnit(double f) {
    if (f < 1e3) {
      return "${(f).toStringAsFixed(3)}  Hz";
    } else if (f < 1e6) {
      return "${(f / 1e3).toStringAsFixed(3)}  kHz";
    } else if (f < 1e9) {
      return "${(f / 1e6).toStringAsFixed(3)}  MHz";
    }

    return "";
  }
}
