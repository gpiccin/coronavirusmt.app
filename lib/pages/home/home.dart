import 'package:covidmt/pages/home/widget/card_srag_consolidado.dart';
import 'package:covidmt/pages/home/widget/card_srag_grafico_diario.dart';
import 'package:covidmt/pages/home/widget/grid_covid_indicadores.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            Expanded(
              child: Container(
                child: ListView(padding: EdgeInsets.all(0), children: <Widget>[
                  CardSRAGDadosConsolidados(),
                  CardSRAGGraficoDiario(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        this.defaultPadding, 0, this.defaultPadding, 0),
                    child: GridCovidIndicadores(),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
