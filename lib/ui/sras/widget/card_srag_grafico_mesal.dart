import 'package:covidmt/ui/sras/widget/sars_chart_mensal.dart';
import 'package:flutter/material.dart';

class CardSRAGGraficoMensal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      margin: EdgeInsets.only(left: 12, right: 12),
      elevation: 3,
      color: Color(0xffF0F0F0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 13.0, top: 10),
            child: Text(
              "SRAG por meses",
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SragChartMensal()
        ],
      ),
    ));
  }
}
