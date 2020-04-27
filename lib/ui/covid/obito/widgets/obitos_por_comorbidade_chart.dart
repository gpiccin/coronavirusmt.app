/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosPorComorbidadeChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> obitos;

  ObitosPorComorbidadeChart(this.obitos,
      {this.height = 200, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: new charts.BarChart(
        _createObitoSeries(),
        animate: animate,
        vertical: false,
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        domainAxis: new charts.OrdinalAxisSpec(),
      ),
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
