import 'package:covidmt/pages/home/widget/card_srag_consolidado.dart';
import 'package:covidmt/pages/home/widget/card_srag_grafico_diario.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                color: Colors.yellow,
                child: ListView(padding: EdgeInsets.all(0), children: <Widget>[
                  CardSRAGDadosConsolidados(),
                  CardSRAGGraficoDiario()
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
