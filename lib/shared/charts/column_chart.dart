import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ColumnChart {
  List<BarChartRodData> lista_colunas;
  BarChartGroupData coluna_agrupada;
  List<BarChartGroupData> lista_coluna_agrupada;

  ColumnChart() {
    lista_colunas = new List<BarChartRodData>();

    lista_coluna_agrupada = new List<BarChartGroupData>();
  }

  List<BarChartRodData> retornaListaColunas() {
    return lista_colunas;
  }

  reinicia() {
    lista_colunas = null;
    lista_colunas = new List<BarChartRodData>();
  }

  adcionaColuna(double qtdInicial, double qtdFinal, Color cor) {
    lista_colunas.add(new BarChartRodData(
        y: qtdFinal,
        rodStackItem: [
          BarChartRodStackItem(qtdInicial, qtdFinal, cor),
        ],
        borderRadius: const BorderRadius.all(Radius.zero)));
  }

  // posicao - 0 :primeiro dado a ser mostrado : 1 segundo a ser mostrado..
  BarChartGroupData agrupaColunas(
      int posicao, double espaco, List<BarChartRodData> listaColunas) {
    coluna_agrupada = new BarChartGroupData(
        x: posicao, barsSpace: espaco, barRods: listaColunas);
    lista_coluna_agrupada.add(coluna_agrupada);
    return coluna_agrupada;
  }

  List<BarChartGroupData> retornaListaColunasAgrupadas() {
    return lista_coluna_agrupada;
  }
}
