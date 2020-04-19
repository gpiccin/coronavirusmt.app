/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/model/key_value.dart';
import 'package:flutter/material.dart';

class ObitosPorSexoChart extends StatelessWidget {
  final bool animate;
  final List<KeyValue> obitos;

  ObitosPorSexoChart(this.obitos, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.PieChart(createObitoSeries(),
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 20,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  List<charts.Series<KeyValue, String>> createObitoSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Óbitos por sexo',
          domainFn: (KeyValue obito, _) => obito.key,
          measureFn: (KeyValue obito, _) => obito.value,
          data: this.obitos,
          labelAccessorFn: (KeyValue obito, _) =>
              '${obito.key}: ${obito.value}',
          colorFn: (_, __) => charts.Color.fromHex(code: "#D32F2F")),
    ];
  }
}
