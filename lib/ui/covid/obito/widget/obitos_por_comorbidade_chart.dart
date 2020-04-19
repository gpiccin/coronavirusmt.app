/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/model/key_value.dart';
import 'package:covidmt/ui/base/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosPorComorbidade extends StatelessWidget {
  final bool animate;
  final List<KeyValue> obitos;

  ObitosPorComorbidade(this.obitos, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createObitoSeries(),
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  List<charts.Series<KeyValue, String>> _createObitoSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Óbitos por comorbidade',
          domainFn: (KeyValue obito, _) => obito.key,
          measureFn: (KeyValue obito, _) => obito.value,
          data: this.obitos,
          colorFn: (_, __) =>
              charts.Color.fromHex(code: UIStyle.obitosColorHex),
          labelAccessorFn: (KeyValue obito, _) => '${obito.value}')
    ];
  }
}
