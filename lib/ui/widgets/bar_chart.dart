import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class BarChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> casos;

  final Color color;

  BarChart(this.casos, this.color, {this.height = 220, this.animate = true});

  double get maximoDeCasos =>
      this.casos.map((e) => e.value as int).reduce(max).toDouble() * 1.1;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            axisLine: AxisLine(width: 0),
            labelPosition: ChartDataLabelPosition.outside,
          ),
          primaryYAxis:
              NumericAxis(isVisible: true, minimum: 0, maximum: maximoDeCasos),
          series: _getSeries(),
          tooltipBehavior: TooltipBehavior(
              enable: true,
              canShowMarker: false,
              format: 'point.x : point.y',
              header: ''),
        ));
  }

  List<BarSeries<KeyValue, String>> _getSeries() {
    return <BarSeries<KeyValue, String>>[
      BarSeries<KeyValue, String>(
        enableTooltip: true,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.auto),
        dataSource: this.casos,
        color: color,
        xValueMapper: (KeyValue value, _) => value.key,
        yValueMapper: (KeyValue value, _) => value.value,
      ),
    ];
  }
}
