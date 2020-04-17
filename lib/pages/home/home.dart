import 'package:covidmt/pages/home/widget/grid_covid_indicadores.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:covidmt/pages/sras/srars_controller.dart';
import 'package:covidmt/pages/sras/widget/card_srag_indicador.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 12.0;
  Srars_controller srars_controller = null;

  Future<bool> _onBackPressed() async {
    print('moon walking..');
  }

  carregaDadosFuture(BuildContext context) async {
    await buscarUltimoCasoSars(context);
  }

  buscarUltimoCasoSars(BuildContext context) async {
    srars_controller = Provider.of<Srars_controller>(context);
    await srars_controller.buscarUltimoCasoSars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: headerBackgroundColor,
        elevation: 0,
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: FutureBuilder<Object>(
            future: carregaDadosFuture(context),
            builder: (context, snapshot) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header(),
                    Expanded(
                      child: Container(
                        child: ListView(
                            padding: EdgeInsets.all(0),
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(this.defaultPadding),
                                child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        this.defaultPadding,
                                        this.defaultPadding,
                                        0,
                                        0),
                                    child: Text(
                                      "COVID-19",
                                      style: headerStyle,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    this.defaultPadding,
                                    0,
                                    this.defaultPadding,
                                    0),
                                child: GridCovidIndicadores(),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    this.defaultPadding + 4,
                                    0,
                                    this.defaultPadding + 4,
                                    0),
                                child: Divider(),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    this.defaultPadding,
                                    0,
                                    this.defaultPadding,
                                    0),
                                child: CardSRAGIndicador(
                                    "SRAG - 01/01/2020 até ${srars_controller.ultimoCaso.data.day}/${srars_controller.ultimoCaso.data.month}/${srars_controller.ultimoCaso.data.year} ",
                                    srars_controller.ultimoCaso.sragCasosTotal
                                        .toString(),
                                    "438",
                                    "438"),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
