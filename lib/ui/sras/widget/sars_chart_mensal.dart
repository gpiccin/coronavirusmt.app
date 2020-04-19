import 'package:covidmt/ui/base/ui_style.dart';
import 'package:covidmt/ui/sras/srars_controller.dart';
import 'package:covidmt/ui/sras/tempo_relatorio_sras.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SragChartMensal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SragChartMensalState();
}

class SragChartMensalState extends State<SragChartMensal> {
  List<FlSpot> listaDadosCharts = [];
  List<int> meses = [];
  List<int> valoresChartsMeses = [];
  SrarsController srarsController;
  final double intervaloChart = 30;

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> carregaDadosSrarsMensais(BuildContext context) async {
    srarsController = Provider.of<SrarsController>(context);
    listaDadosCharts = await srarsController.carregaGraficoMensais(
        TempoRelatorioSars.TWELVE_WEKENDS, UIStyle.chartColorSars);

    meses = this.srarsController.getRetornaSemanas();
    valoresChartsMeses = this.srarsController.getNumerosApresentaGraficoMeses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: this.carregaDadosSrarsMensais(context),
        builder: (context, snapshot) {
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
                    child: LineChart(mainData()),
                  ),
                ),
              ),
            ],
          );
        });
  }

  mainData() {
    return this.srarsController.isCarregando
        ? CircularProgressIndicator()
        : LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: UIStyle.chartLineColor,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: UIStyle.chartLineColor,
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
                          .srarsController
                          .getNomeMes(this.srarsController.getListaMeses()[0]);
                    case 6:
                      return this
                          .srarsController
                          .getNomeMes(this.srarsController.getListaMeses()[1]);
                    case 11:
                      return this
                          .srarsController
                          .getNomeMes(this.srarsController.getListaMeses()[2]);
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
                  } else if (value.toInt() == valoresChartsMeses[1]) {
                    return valoresChartsMeses[1].toString();
                  } else if (value.toInt() == valoresChartsMeses[2]) {
                    return valoresChartsMeses[2].toString();
                  } else if (value.toInt() == valoresChartsMeses[3]) {
                    return valoresChartsMeses[3].toString();
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
            maxY: this.srarsController.getMaxNumeroSarsMeses(),
            lineBarsData: [
              LineChartBarData(
                //
                spots: listaDadosCharts.length > 0
                    ? listaDadosCharts
                    : [FlSpot(0, 0)],
                isCurved: true,
                colors: gradientColors,
                barWidth: 4,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.4))
                      .toList(),
                ),
              ),
            ],
          );
  }
}
