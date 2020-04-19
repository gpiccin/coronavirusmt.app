import 'package:covidmt/ui/pages/sras/widget/card_srag_grafico_diario.dart';
import 'package:covidmt/ui/pages/sras/widget/card_srag_grafico_mesal.dart';
import 'package:covidmt/ui/base/ui_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'srars_controller.dart';

class SrarsPage extends StatefulWidget {
  @override
  _SrarsPanelState createState() => _SrarsPanelState();
}

class _SrarsPanelState extends State<SrarsPage> {
  @override
  void initState() {
    super.initState();
  }

  SrarsController controller;

  iniciaProvider(BuildContext context) async {
    controller = Provider.of<SrarsController>(context);
    await controller.carregaDados();

    controller.isCarregando = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: UIStyle.headerBackgroundColor,
          elevation: 0,
          title: Text(
            "Srars",
          ),
        ),
        body: FutureBuilder<Object>(
            future: this.iniciaProvider(context),
            builder: (context, snapshot) {
              return (this.controller.isCarregando
                  ? Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ))
                  : Column(
                      children: <Widget>[
                        CardSRAGGraficoDiario(),
                        SizedBox(
                          height: 30,
                        ),
                        this.controller.isCarregando
                            ? CircularProgressIndicator()
                            : CardSRAGGraficoMensal()
                      ],
                    ));
            }));
  }
}
