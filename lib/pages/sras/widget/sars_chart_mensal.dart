import 'package:covidmt/model/boletim.dart';
import 'package:covidmt/pages/sras/srars_controller.dart';
import 'package:covidmt/shared/charts/column_chart.dart';
import 'package:covidmt/shared/tempo_relatorio_sras.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SragChartMensal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SragChartMensalState();
}

class SragChartMensalState extends State<SragChartMensal> {
  List<FlSpot> listaDadosCharts = [];
  List<int> meses = [];
  List<int> valores_charts_meses = [];
  Srars_controller srars_controller;
  final double intervalo_chart = 30;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    super.initState();
    carregaDadosSrars();
  }

  void carregaDadosSrars() {
    srars_controller = Srars_controller();
    listaDadosCharts = srars_controller.carregaGraficoMensais(
        TempoRelatorioSars.TWELVE_WEKENDS, chartColorSars);
    meses = this.srars_controller.getRetornaSemanas();
    valores_charts_meses =
        this.srars_controller.getNumerosApresentaGraficoMeses();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: chartLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: chartLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 25,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return this
                    .srars_controller
                    .getNomeMes(this.srars_controller.getListaMeses()[0]);
              case 6:
                return this
                    .srars_controller
                    .getNomeMes(this.srars_controller.getListaMeses()[1]);
              case 11:
                return this
                    .srars_controller
                    .getNomeMes(this.srars_controller.getListaMeses()[2]);
            }
            return '';
          },
          margin: 4,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            if (value.toInt() == 0) {
              return '0';
            } else if (value.toInt() == valores_charts_meses[1]) {
              return valores_charts_meses[1].toString();
            } else if (value.toInt() == valores_charts_meses[2]) {
              return valores_charts_meses[2].toString();
            } else if (value.toInt() == valores_charts_meses[3]) {
              return valores_charts_meses[3].toString();
            } else
              return '';
          },
          reservedSize: 18,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 0.4)),
      minX: 0,
      maxX: 14,
      minY: 0,
      maxY: this.srars_controller.getMaxNumeroSarsMeses(),
      lineBarsData: [
        LineChartBarData(
          //
          spots: listaDadosCharts,
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.4)).toList(),
          ),
        ),
      ],
    );
  }
}
