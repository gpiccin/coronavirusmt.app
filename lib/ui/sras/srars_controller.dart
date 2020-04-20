import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/core/models/srars_model.dart';
import 'package:coronavirusmt/core/services/api.dart';

import 'package:coronavirusmt/ui/charts/column_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SrarsController {
  Api _api = locator<Api>();

  List<SrasModel> listaCasos = [];
  SrasModel ultimoCaso;
  List<double> listaGraficosMeses = [];
  List<int> semanas = [];
  List<int> meses = [];
  double qtdCasosSemanaAnterior;
  DateTime diaAtual = DateTime.now();
  bool isCarregando = true;

  double numMaxSarsSemanal = 0;

  carregaDados() async {
    if (listaCasos.length == 0) {
      var itens = await _api.getDadosSars();

      for (int i = 0; i < itens.length; i++) {
        SrasModel srars = SrasModel.fromJson(itens[i]);
        listaCasos.add(srars);
      }
    }
  }

  buscarUltimoCasoSars() async {
    if (ultimoCaso == null) {
      var itens = await _api.getUltimoRegistroDadosSars();
      ultimoCaso = SrasModel.fromJson(itens[0]);
    }
  }

  double getMaxNumeroSars() {
    if (listaCasos.length == 0)
      return 0;
    else {
      return this.listaCasos[listaCasos.length - 1].sragCasosTotal.toDouble();
    }
  }

  // List<SrasModel> getListaSras() {
  //   listaCasos.sort((a, b) => a.data.compareTo(b.data));
  //   return listaCasos;
  // }

  // void carregaGraficoSars(TempoRelatorioSars tipo_relatorio, Color color) {
  //   this.carregaDados();
  //   this.carregarGrafico(color);
  // }

  Future<List<BarChartGroupData>> carregaGraficoSemanas(
      int qtdDias, Color color) async {
    if (listaCasos.length == 0) await this.carregaDados();
    semanas = [];
    List<SrasModel> lista = listaCasos;
    DateTime dataInicial = DateTime.now();

    dataInicial = dataInicial.subtract(new Duration(days: qtdDias));
    dataInicial = dataInicial.subtract(new Duration(days: dataInicial.weekday));

    lista = lista.where((itens) => itens.data.isAfter(dataInicial)).toList();

    int semanaAtual = 1;
    ColumnChart grafico = new ColumnChart();
    semanas.add(semanaAtual);

    int y = 0;
    for (int i = 0; i < lista.length; i++) {
      //print(
      // ' semana $semanaAtual data: ${lista[i].dataRegistro.toString()} qtd casos dia:${lista[i].qtdCasos} ');
      if (lista[i].data.weekday < 7) {
        grafico.adcionaColuna(
            0,
            lista[i].sragCasosNovos != null
                ? lista[i].sragCasosNovos.toDouble()
                : lista[i].sragCasosTotal.toDouble(),
            color);
        if (numMaxSarsSemanal < grafico.listaColunas[y].y)
          numMaxSarsSemanal = grafico.listaColunas[y].y;

        if ((i + 1) == lista.length)
          grafico.agrupaColunas(semanaAtual, 4, grafico.listaColunas);
      } else {
        grafico.agrupaColunas(semanaAtual, 4, grafico.listaColunas);
        semanaAtual += 1;

        grafico.reinicia();
        grafico.adcionaColuna(0, lista[i].sragCasosNovos.toDouble(), color);
        if (numMaxSarsSemanal < grafico.listaColunas[0].y)
          numMaxSarsSemanal = grafico.listaColunas[0].y;
        y = 0;
        semanas.add(semanaAtual);
      }
      y += 1;
    }
    print('numero max columana semanal $numMaxSarsSemanal');

    return grafico.retornaListaColunasAgrupadas();
  }

  List<int> getRetornaSemanas() => this.semanas;

  Future<List<FlSpot>> carregaGraficoMensais(int qtdDias, Color color) async {
    if (listaCasos.length == 0) await this.carregaDados();
    meses = [];
    List<SrasModel> lista = listaCasos;
    DateTime dataInicial = DateTime.now();
    List<FlSpot> listaGrafico = new List<FlSpot>();

    dataInicial = dataInicial.subtract(new Duration(days: 60));

    dataInicial = dataInicial.subtract(new Duration(days: dataInicial.day));

    calculaValorMinimoSemanaAnterior(dataInicial, lista);

    lista = lista.where((data) => data.data.isAfter(dataInicial)).toList();
    lista.sort((a, b) => a.data.compareTo(b.data));

    int mesAtual = lista[0].data.month;

    double valorSemanal = 0;
    double semana = 0;
    // print(
    //     'qtd vector: ${lista.length} mes atual: $mesAtual  data inicio : ${lista[0].dataRegistro} onde a data inicial : ${dataInicial.toString()}  qtd casos semana anterior: ${this.getRetornaQtdMinimaSemanaAnteriorGraficoMeses()}');
    addListaTituloMeses(mesAtual);
    listaGrafico.add(new FlSpot(
        semana, this.getRetornaQtdMinimaSemanaAnteriorGraficoMeses()));

    for (int i = 0; i < lista.length; i++) {
      if (lista[i].data.month > mesAtual) {
        mesAtual = lista[i].data.month;
      }

      if (lista[i].data.weekday < 7) {
        valorSemanal += lista[i].sragCasosNovos != null
            ? lista[i].sragCasosNovos.toDouble()
            : lista[i].sragCasosTotal.toDouble();

        if ((i + 1) == lista.length) {
          listaGraficosMeses.add(valorSemanal);
          listaGrafico.add(new FlSpot(semana, valorSemanal));
          // print('semana: $semana QTD: $valorSemanal espaço: ${semana}');
        }
      } else {
        listaGrafico.add(new FlSpot(semana, valorSemanal));
        listaGraficosMeses.add(valorSemanal);
        //  print('semana: $semana QTD: $valorSemanal   espaço : ${semana}');
        valorSemanal = lista[i].sragCasosNovos.toDouble();
        mesAtual += 1;
        semana += 1;
      }
    }

    return listaGrafico;
  }

  double getMaxNumeroSarsMeses() {
    if (listaGraficosMeses.length > 0) {
      listaGraficosMeses?.sort((a, b) => b.compareTo(a));
      return listaGraficosMeses.first;
    } else
      return 0;
  }

  List<int> getNumerosApresentaGraficoMeses() {
    List<int> numeros = [];
    double max = getMaxNumeroSarsMeses();
    print(max);
    int valorDividido = max ~/ 3;
    numeros.add(0);
    numeros.add(valorDividido);
    numeros.add(valorDividido * 2);
    numeros.add(valorDividido * 3);

    return numeros;
  }

  List<int> getListaMeses() => meses.length > 0 ? meses : 0;

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

  calculaValorMinimoSemanaAnterior(
      DateTime dataInicial, List<SrasModel> lista) {
    DateTime dataAnterior = dataInicial.subtract(new Duration(days: 7));
    print(dataInicial.toString());
    print(dataAnterior.toString());

    lista = lista.where((data) => data.data.isAfter(dataAnterior)).toList();
    double valorSemanalAnterior = 0;
    for (int i = 0; i < lista.length; i++) {
      if (lista[i].data.isBefore(dataInicial)) {
        valorSemanalAnterior += lista[i].sragCasosNovos;
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
