import 'package:covidmt/shared/screen.dart';
import 'package:flutter/material.dart';

class CardGraficoPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Screen.getWidth(context),
        child: Card(
          margin: EdgeInsets.only(left: 20, right: 8),
          elevation: 3,
          color: Color(0xffF0F0F0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 13.0, top: 10),
                child: Text(
                  "SRAG por dia",
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            ],
          ),
        ));
  }
}
