/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:flutter/material.dart';

class AcumuladosPorDiaChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> casos;

  final String hexColor;

  AcumuladosPorDiaChart(this.casos, this.hexColor,
      {this.height = 220, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: new charts.TimeSeriesChart(_createSeries(),
          animate: animate,
          domainAxis: new charts.EndPointsTimeAxisSpec(),
          defaultRenderer: new charts.LineRendererConfig(
              includePoints: true, includeLine: true)),
    );
  }

  List<charts.Series<KeyValue, DateTime>> _createSeries() {
    return [
      new charts.Series<KeyValue, DateTime>(
          id: 'Casos acumulados por dia',
          domainFn: (KeyValue caso, _) => caso.key,
          measureFn: (KeyValue caso, _) => caso.value,
          data: this.casos,
          colorFn: (_, __) => charts.Color.fromHex(code: this.hexColor),
          labelAccessorFn: (KeyValue caso, _) => '${caso.value}')
    ];
  }
}
