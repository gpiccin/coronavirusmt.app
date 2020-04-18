import 'package:covidmt/pages/sras/srars_controller.dart';
import 'package:covidmt/pages/sras/tempo_relatorio_sras.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SragChartSemanal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SragChartState();
}

class SragChartState extends State<SragChartSemanal> {
  List<BarChartGroupData> data = [];
  List<int> semanas = [];

  double intervaloChartSemanal = 3;
  SrarsController srarsController;

  @override
  initState() {
    super.initState();
    //carregaDadosSrars();
  }

  Future<dynamic> carregaDadosSrars(BuildContext context) async {
    print('inicio chart semanal');
    srarsController = Provider.of<SrarsController>(context);

    data = await srarsController.carregaGraficoSemanas(
        TempoRelatorioSars.TWO_WEKENDS, chartColorSars);
    // print('end carrega graficos chart semanal');
    semanas = this.srarsController.getRetornaSemanas();
  }

  @override
  build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.66,
        child: FutureBuilder<dynamic>(
            future: this.carregaDadosSrars(context),
            builder: (context, snapshot) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      maxY: this.srarsController.numMaxSarsSemanal,
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
                            switch (this.semanas[value.toInt()]) {
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
                          interval: this.srarsController.numMaxSarsSemanal /
                              intervaloChartSemanal,
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
              );
            }));
  }
}
