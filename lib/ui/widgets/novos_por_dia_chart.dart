import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class NovosPorDiaChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> casos;

  final Color color;

  NovosPorDiaChart(this.casos, this.color,
      {this.height = 220, this.animate = true});

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

  List<ColumnSeries<KeyValue, String>> _getSeries() {
    return <ColumnSeries<KeyValue, String>>[
      ColumnSeries<KeyValue, String>(
        enableTooltip: true,
        dataLabelSettings: DataLabelSettings(
            isVisible: false, labelAlignment: ChartDataLabelAlignment.outer),
        dataSource: this.casos,
        color: color,
        xValueMapper: (KeyValue value, _) => UIHelper.fomartDateDM(value.key),
        yValueMapper: (KeyValue value, _) => value.value,
      ),
    ];
  }
}
