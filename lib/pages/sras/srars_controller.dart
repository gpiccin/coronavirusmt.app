import 'package:covidmt/model/boletim.dart';
import 'package:covidmt/model/tipo_doenca.dart';
import 'package:covidmt/model/tipo_registro.dart';
import 'package:covidmt/shared/charts/column_chart.dart';
import 'package:covidmt/shared/tempo_relatorio_sras.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Srars_controller {
  List<Boletim> listaCasos;

  List<double> listaGraficosMeses = [];
  List<int> semanas = [];
  List<int> meses = [];
  double qtdCasosSemanaAnterior;
  DateTime diaAtual = DateTime.now();
  List<Boletim> carregaDados() {
    listaCasos = new List<Boletim>();
    int day = 0;
    int mesAtual = 1;
    for (int i = 1; i <= 30; i++) {
      Boletim boletim = new Boletim(
          numeroBoletim: 1,
          cidade: "Cuiaba",
          qtdCasos: (i * 2 >= 150 ? i * 1 - 50 : i * 3),
          tipoDoenca: TipoDoenca.SRARS,
          tipoRegistro: TipoRegistro.NOTIFICADOS,
          dataRegistro: DateTime(2020, mesAtual, i, 0, 0, 0));

      listaCasos.add(boletim);
      if (i == 30) {
        mesAtual += 1;
        i = 1;
        if (mesAtual == diaAtual.month) break;
      }
    }
    for (int i = 1; i <= diaAtual.day; i++) {
      Boletim boletim = new Boletim(
          numeroBoletim: 1,
          cidade: "Cuiaba",
          qtdCasos: (i * 6 >= 150 ? i * 6 : i * 6),
          tipoDoenca: TipoDoenca.SRARS,
          tipoRegistro: TipoRegistro.NOTIFICADOS,
          dataRegistro: DateTime(2020, diaAtual.month, i, 0, 0, 0));

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
      //print(
      // ' semana $semanaAtual data: ${lista[i].dataRegistro.toString()} qtd casos dia:${lista[i].qtdCasos} ');
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

  List<FlSpot> carregaGraficoMensais(int qtdDias, Color color) {

    this.carregaDados();
    meses = [];
    List<Boletim> lista = this.getListaSras();
    DateTime dataInicial = DateTime.now();
    DateTime dataAnterior;

    List<FlSpot> listaGrafico = new List<FlSpot>();

    dataInicial = dataInicial.subtract(new Duration(days: 60));

    dataInicial = dataInicial.subtract(new Duration(days: dataInicial.day));

    calculaValorMinimoSemanaAnterior(dataInicial, lista);

    lista =
        lista.where((data) => data.dataRegistro.isAfter(dataInicial)).toList();
    lista.sort((a, b) => a.dataRegistro.compareTo(b.dataRegistro));
    int mesAtual = lista[0].dataRegistro.month;

    double valorSemanal = 0;
    double semana = 0;
    // print(
    //     'qtd vector: ${lista.length} mes atual: $mesAtual  data inicio : ${lista[0].dataRegistro} onde a data inicial : ${dataInicial.toString()}  qtd casos semana anterior: ${this.getRetornaQtdMinimaSemanaAnteriorGraficoMeses()}');
    addListaTituloMeses(mesAtual);
    listaGrafico.add(new FlSpot(
        semana, this.getRetornaQtdMinimaSemanaAnteriorGraficoMeses()));
    double qtdEspaco = 0;
    if (lista.length < 60) qtdEspaco = (lista.length / 12) / 5;
    // meses.add(lista[0].dataRegistro.month);
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].dataRegistro.month > mesAtual) {
        mesAtual = lista[i].dataRegistro.month;
      }

      if (lista[i].dataRegistro.weekday < 7) {
        valorSemanal += lista[i].qtdCasos.toDouble();

        if ((i + 1) == lista.length) {
          listaGraficosMeses.add(valorSemanal);
          listaGrafico.add(new FlSpot(semana, valorSemanal));
          // print('semana: $semana QTD: $valorSemanal espaço: ${semana}');
        }
      } else {
        listaGrafico.add(new FlSpot(semana, valorSemanal));
        listaGraficosMeses.add(valorSemanal);
        //  print('semana: $semana QTD: $valorSemanal   espaço : ${semana}');
        valorSemanal = lista[i].qtdCasos.toDouble();
        mesAtual += 1;
        semana += 1;
      }
    }

    return listaGrafico;
  }

  double getMaxNumeroSarsMeses() {
    listaGraficosMeses?.sort((a, b) => b.compareTo(a));

    return listaGraficosMeses.first;
  }

  List<int> getNumerosApresentaGraficoMeses() {
    List<int> numeros = [];
    double max = getMaxNumeroSarsMeses();
    print(max);
    int valor_dividido = (max / 3).toInt();
    numeros.add(0);
    numeros.add(valor_dividido);
    numeros.add(valor_dividido * 2);
    numeros.add(valor_dividido * 3);

    return numeros;
  }

  List<int> getListaMeses() => meses;

  String getNomeMes(int mes) {
    switch (mes) {
      case 1:
        return "JAN";
        break;
      case 2:
        return "FEV";
        break;
      case 3:
        return "MAR";

        break;
      case 4:
        return "ABR";

        break;
      case 5:
        return "MAI";
        break;
      case 6:
        return "JUN";
        break;
      case 7:
        return "JUL";
        break;
      case 8:
        return "AGO";
        break;
      case 9:
        return "SET";
        break;
      case 10:
        return "OUT";
        break;
      case 11:
        return "NOV";
        break;
      case 12:
        return "DEZ";
        break;

      default:
        return "";
    }
  }

  addListaTituloMeses(int month) {
    switch (month) {
      case 1:
        meses.add(1);
        meses.add(2);
        meses.add(3);
        break;
      case 2:
        meses.add(2);
        meses.add(3);
        meses.add(4);
        break;
      case 3:
        meses.add(3);
        meses.add(4);
        meses.add(5);
        break;
      case 4:
        meses.add(4);
        meses.add(5);
        meses.add(6);
        break;
      case 5:
        meses.add(5);
        meses.add(6);
        meses.add(7);
        break;
      case 6:
        meses.add(6);
        meses.add(7);
        meses.add(8);
        break;
      case 7:
        meses.add(7);
        meses.add(8);
        meses.add(9);
        break;
      case 8:
        meses.add(8);
        meses.add(9);
        meses.add(10);
        break;
      case 9:
        meses.add(9);
        meses.add(10);
        meses.add(11);
        break;
      case 10:
        meses.add(10);
        meses.add(11);
        meses.add(12);
        break;
      case 11:
        meses.add(11);
        meses.add(12);
        meses.add(1);
        break;
      case 12:
        meses.add(12);
        meses.add(1);
        meses.add(2);
        break;
      case 13:
        meses.add(1);
        meses.add(2);
        meses.add(3);
        break;
    }
  }

  calculaValorMinimoSemanaAnterior(DateTime dataInicial, List<Boletim> lista) {
    DateTime dataAnterior = dataInicial.subtract(new Duration(days: 7));
    print(dataInicial.toString());
    print(dataAnterior.toString());

    lista =
        lista.where((data) => data.dataRegistro.isAfter(dataAnterior)).toList();
    double valorSemanalAnterior = 0;
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].dataRegistro.isBefore(dataInicial)) {
        valorSemanalAnterior += lista[i].qtdCasos;
      } else {
        print('rodou $i vezes, valor $valorSemanalAnterior');
        break;
      }
    }
    qtdCasosSemanaAnterior = valorSemanalAnterior;
  }

  double getRetornaQtdMinimaSemanaAnteriorGraficoMeses() {
    return qtdCasosSemanaAnterior;
  }
}
