/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/model/key_value.dart';
import 'package:flutter/material.dart';

class ObitosPorCidadeChart extends StatelessWidget {
  final bool animate;
  final List<KeyValue> obitos;

  ObitosPorCidadeChart(this.obitos, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      createObitoSeries(),
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  List<charts.Series<KeyValue, String>> createObitoSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Óbitos por cidade',
          domainFn: (KeyValue obito, _) => obito.key,
          measureFn: (KeyValue obito, _) => obito.value,
          data: this.obitos,
          colorFn: (_, __) => charts.Color.fromHex(code: "#D32F2F"),
          labelAccessorFn: (KeyValue obito, _) => '${obito.value}')
    ];
  }
}
