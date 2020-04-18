import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ColumnChart {
  List<BarChartRodData> listaColunas;
  BarChartGroupData colunaAgrupada;
  List<BarChartGroupData> listaColunaAgrupada;

  ColumnChart() {
    listaColunas = new List<BarChartRodData>();

    listaColunaAgrupada = new List<BarChartGroupData>();
  }

  List<BarChartRodData> retornaListaColunas() {
    return listaColunas;
  }

  reinicia() {
    listaColunas = null;
    listaColunas = new List<BarChartRodData>();
  }

  adcionaColuna(double qtdInicial, double qtdFinal, Color cor) {
    listaColunas.add(new BarChartRodData(
        y: qtdFinal,
        rodStackItem: [
          BarChartRodStackItem(qtdInicial, qtdFinal, cor),
        ],
        borderRadius: const BorderRadius.all(Radius.zero)));
  }

  // posicao - 0 :primeiro dado a ser mostrado : 1 segundo a ser mostrado..
  BarChartGroupData agrupaColunas(
      int posicao, double espaco, List<BarChartRodData> listaColunas) {
    colunaAgrupada = new BarChartGroupData(
        x: posicao, barsSpace: espaco, barRods: listaColunas);
    listaColunaAgrupada.add(colunaAgrupada);
    return colunaAgrupada;
  }

  List<BarChartGroupData> retornaListaColunasAgrupadas() {
    return listaColunaAgrupada;
  }
}
