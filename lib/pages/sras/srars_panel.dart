import 'package:covidmt/pages/sras/widget/card_srag_grafico_diario.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';

class SrarsPage extends MaterialPageRoute<Null> {
  SrarsPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: headerBackgroundColor,
                elevation: 0,
                title: Text(
                  "Srars",
                ),
              ),
              body: Column(
                children: <Widget>[CardSRAGGraficoDiario()],
              ));
        });
}
