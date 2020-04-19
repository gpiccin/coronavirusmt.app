/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/models/key_value.dart';
import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosPorSexoChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> obitos;

  ObitosPorSexoChart(this.obitos, {this.height = 200, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: new charts.PieChart(_createObitoSeries(),
          animate: animate,
          defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 20,
              arcRendererDecorators: [new charts.ArcLabelDecorator()])),
    );
  }

  List<charts.Series<KeyValue, String>> _createObitoSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Óbitos por sexo',
          domainFn: (KeyValue obito, _) => obito.key,
          measureFn: (KeyValue obito, _) => obito.value,
          data: this.obitos,
          labelAccessorFn: (KeyValue obito, _) =>
              '${obito.key}: ${obito.value}',
          colorFn: (_, __) =>
              charts.Color.fromHex(code: UIStyle.obitosColorHex)),
    ];
  }
}
