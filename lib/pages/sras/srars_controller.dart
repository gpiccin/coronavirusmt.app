import 'package:covidmt/model/boletim.dart';
import 'package:covidmt/model/tipo_doenca.dart';
import 'package:covidmt/model/tipo_registro.dart';
import 'package:covidmt/shared/charts/column_chart.dart';
import 'package:covidmt/shared/tempo_relatorio_sras.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Srars_controller {
  List<Boletim> listaCasos;
  List<int> semanas = [];
  List<Boletim> carregaDados() {
    listaCasos = new List<Boletim>();
    int day = 0;
    for (int i = 1; i <= 30; i++) {
      Boletim boletim = new Boletim(
          numeroBoletim: 1,
          cidade: "Cuiaba",
          qtdCasos: (i * 3 >= 150 ? i * 3 - 50 : i * 3),
          tipoDoenca: TipoDoenca.SRARS,
          tipoRegistro: TipoRegistro.NOTIFICADOS,
          dataRegistro: DateTime(2020, 3, i, 0, 0, 0));

      listaCasos.add(boletim);
    }
    for (int i = 1; i <= 11; i++) {
      Boletim boletim = new Boletim(
          numeroBoletim: 1,
          cidade: "Cuiaba",
          qtdCasos: (i * 6 >= 150 ? i * 6 - 50 : i * 6),
          tipoDoenca: TipoDoenca.SRARS,
          tipoRegistro: TipoRegistro.NOTIFICADOS,
          dataRegistro: DateTime(2020, 4, i, 0, 0, 0));

      listaCasos.add(boletim);
    }

    listaCasos = carregaListaSras();

    return listaCasos;
  }

  List<Boletim> carregaListaSras() {
    List<Boletim> lista = new List<Boletim>();
    lista = listaCasos;

    return lista.where((v) => v.tipoDoenca == TipoDoenca.SRARS).toList();
  }

  double getMaxNumeroSars() {
    List<Boletim> lista = carregaListaSras();
    lista.sort((a, b) => b.qtdCasos.compareTo(a.qtdCasos));

    return lista.first.qtdCasos.toDouble();
  }

  List<Boletim> getListaSras() {
    listaCasos.sort((a, b) => a.dataRegistro.compareTo(b.dataRegistro));
    return listaCasos;
  }

  // void carregaGraficoSars(TempoRelatorioSars tipo_relatorio, Color color) {
  //   this.carregaDados();
  //   this.carregarGrafico(color);
  // }

  List<BarChartGroupData> carregaGraficoSemanas(int qtdDias, Color color) {
    this.carregaDados();
    semanas = [];
    List<Boletim> lista = this.getListaSras();
    DateTime dataInicial = DateTime.now();

    dataInicial = dataInicial.subtract(new Duration(days: qtdDias));
    dataInicial = dataInicial.subtract(new Duration(days: dataInicial.weekday));

    lista =
        lista.where((data) => data.dataRegistro.isAfter(dataInicial)).toList();

    int semanaAtual = 1;
    ColumnChart grafico = new ColumnChart();
    semanas.add(semanaAtual);

    for (int i = 0; i < lista.length; i++) {
      print(
          ' semana $semanaAtual data: ${lista[i].dataRegistro.toString()} qtd casos dia:${lista[i].qtdCasos} ');
      if (lista[i].dataRegistro.weekday < 7) {
        grafico.adcionaColuna(0, lista[i].qtdCasos.toDouble(), color);
        if ((i + 1) == lista.length)
          grafico.agrupaColunas(semanaAtual, 4, grafico.lista_colunas);
      } else {
        grafico.agrupaColunas(semanaAtual, 4, grafico.lista_colunas);
        semanaAtual += 1;

        grafico.reinicia();
        grafico.adcionaColuna(0, lista[i].qtdCasos.toDouble(), color);
        semanas.add(semanaAtual);
      }
    }

//    List<BarChartGroupData> data = new List<BarChartGroupData>();
    return grafico.retornaListaColunasAgrupadas();
  }

  List<int> getRetornaSemanas() => this.semanas;
}
