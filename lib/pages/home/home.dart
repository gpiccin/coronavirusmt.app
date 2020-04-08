import 'package:covidmt/pages/home/widget/card_consolidado.dart';
import 'package:covidmt/pages/home/widget/card_grafico_principal.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:covidmt/shared/screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        width: Screen.getWidth(context),
        height: Screen.getHeigh(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            Padding(
              padding:
                  EdgeInsets.only(left: Screen.getWidth(context) / 6, top: 15),
              child: Text(
                "SRAG - Síndrome respiratória aguda ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CardDadosConsolidados(),
            SizedBox(
              height: 10,
            ),
            CardGraficoPrincipal(),
          ],
        ),
      ),
    );
  }
}
