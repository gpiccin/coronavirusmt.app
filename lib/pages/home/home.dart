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
      body: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            Container(
                height: 100, color: Colors.blue, child: Text("abcfdsafas")),
            Container(
              color: Colors.black,
              height: 10,
              child: ListView(
                children: <Widget>[],
              ),
            )
          ],
        ),
      ),
    );
  }
}
