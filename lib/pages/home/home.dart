import 'package:covidmt/pages/home/widget/card_srag_indicador.dart';
import 'package:covidmt/pages/home/widget/grid_covid_indicadores.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_style.dart';
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
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: headerBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            Expanded(
              child: Container(
                child: ListView(padding: EdgeInsets.all(0), children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(this.defaultPadding),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            this.defaultPadding, this.defaultPadding, 0, 0),
                        child: Text(
                          "COVID-19",
                          style: headerStyle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        this.defaultPadding, 0, this.defaultPadding, 0),
                    child: GridCovidIndicadores(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        this.defaultPadding + 4, 0, this.defaultPadding + 4, 0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        this.defaultPadding, 0, this.defaultPadding, 0),
                    child: CardSRAGIndicador("SRAG - 01/01/2020 até 09/04/2020",
                        "362", "438", "438"),
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
