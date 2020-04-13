import 'package:covidmt/model/boletim.dart';
import 'package:covidmt/pages/sras/srars_controller.dart';
import 'package:covidmt/shared/charts/column_chart.dart';
import 'package:covidmt/shared/tempo_relatorio_sras.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SragChartSemanal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SragChartState();
}

class SragChartState extends State<SragChartSemanal> {
  List<BarChartGroupData> data = [];
  List<int> meses = [];
  Srars_controller srars_controller;
  final double intervalo_chart = 30;

  @override
  void initState() {
    super.initState();
    carregaDadosSrars();
  }

  void carregaDadosSrars() {
    srars_controller = Srars_controller();
    data = srars_controller.carregaGraficoSemanas(
        TempoRelatorioSars.TWO_WEKENDS, chartColorSars);
    meses = this.srars_controller.getRetornaSemanas();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: this.srars_controller.getMaxNumeroSars(),
              barTouchData: const BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: tituloChart,
                  margin: 5,
                  getTitles: (double value) {
                    switch (this.meses[value.toInt()]) {
                      case 1:
                        return '2 Semanas atras';
                      case 2:
                        return '1 Semanas atras';
                      case 3:
                        return ' Semana Atual';

                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  textStyle: sideTituloChart,
                  getTitles: (double value) {
                    return value.toInt().toString();
                  },
                  interval: this.intervalo_chart,
                  margin: 8,
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 10 == 0,
                getDrawingHorizontalLine: (value) => const FlLine(
                  color: chartLineColor,
                  strokeWidth: 1,
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 25,
              barGroups: data,
            ),
          ),
        ),
      ),
    );
  }
}
