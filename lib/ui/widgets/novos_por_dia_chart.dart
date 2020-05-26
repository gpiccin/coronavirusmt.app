/// Horizontal bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:coronavirusmt/core/models/key_value.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class NovosPorDiaChart extends StatelessWidget {
  final double height;
  final bool animate;
  final List<KeyValue> casos;

  final String hexColor;

  NovosPorDiaChart(this.casos, this.hexColor,
      {this.height = 220, this.animate = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: new charts.BarChart(
        _createSeries(),
        animate: animate,

        /// Assign a custom style for the measure axis.
        ///
        /// The NoneRenderSpec only draws an axis line (and even that can be hidden
        /// with showAxisLine=false).
        // primaryMeasureAxis:
        //     new charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),

        /// This is an OrdinalAxisSpec to match up with BarChart's default
        /// ordinal domain axis (use NumericAxisSpec or DateTimeAxisSpec for
        /// other charts).
        domainAxis: new charts.OrdinalAxisSpec(
            // Make sure that we draw the domain axis line.
            showAxisLine: false,
            // But don't draw anything else.
            renderSpec: new charts.NoneRenderSpec()),
      ),
    );
  }

  List<charts.Series<KeyValue, String>> _createSeries() {
    return [
      new charts.Series<KeyValue, String>(
          id: 'Casos novos por dia',
          domainFn: (KeyValue caso, _) => UIHelper.fomartDateDM(caso.key),
          measureFn: (KeyValue caso, _) => caso.value,
          data: this.casos,
          colorFn: (_, __) => charts.Color.fromHex(code: this.hexColor),
          labelAccessorFn: (KeyValue caso, _) => '${caso.value}')
    ];
  }
}
