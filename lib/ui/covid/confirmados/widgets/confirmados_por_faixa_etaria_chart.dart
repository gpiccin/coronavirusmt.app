/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidmt/core/models/key_value.dart';
import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

class ConfirmadosPorFaixaEtariaChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> casos;

  ConfirmadosPorFaixaEtariaChart(this.casos,
      {this.height = 200, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: new charts.BarChart(
        _createSeries(),
        animate: animate,
        vertical: false,
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        domainAxis: new charts.OrdinalAxisSpec(),
      ),
    );
  }

  List<charts.Series<KeyValue, String>> _createSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Casos por faixa etária',
          domainFn: (KeyValue caso, _) => caso.key,
          measureFn: (KeyValue caso, _) => caso.value,
          data: this.casos,
          colorFn: (_, __) => charts.Color.fromHex(code: UIStyle.casosColorHex),
          labelAccessorFn: (KeyValue caso, _) => '${caso.value}')
    ];
  }
}
