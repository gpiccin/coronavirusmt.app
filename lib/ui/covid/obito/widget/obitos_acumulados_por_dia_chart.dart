/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/model/key_value.dart';
import 'package:covidmt/ui/base/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosAcumuladosPorDiaChart extends StatelessWidget {
  final bool animate;
  final List<KeyValue> obitos;

  ObitosAcumuladosPorDiaChart(this.obitos, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(_createObitoSeries(),
        animate: animate,
        domainAxis: new charts.EndPointsTimeAxisSpec(),
        defaultRenderer: new charts.LineRendererConfig(
            includePoints: true, includeLine: true));
  }

  List<charts.Series<KeyValue, DateTime>> _createObitoSeries() {
    return [
      new charts.Series<KeyValue, DateTime>(
          id: 'Óbitos por acumulados por dia',
          domainFn: (KeyValue obito, _) => obito.key,
          measureFn: (KeyValue obito, _) => obito.value,
          data: this.obitos,
          colorFn: (_, __) =>
              charts.Color.fromHex(code: UIStyle.obitosColorHex),
          labelAccessorFn: (KeyValue obito, _) => '${obito.value}')
    ];
  }
}
