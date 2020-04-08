import 'package:covidmt/shared/screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CardSRAGDadosConsolidados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(12),
        elevation: 3,
        color: Color(0xffF0F0F0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 10),
              child: Text(
                "SRAG entre  01/01/2020 até 06/04/2020",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: Screen.getWidth(context) / 6, top: 3),
              child: Row(
                children: <Widget>[
                  Text(
                    "4,76x ",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    " a mais",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 10),
                  ),
                  Text(
                    " que os casos confirmados",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      " COVID-19 + SRAG = ",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                    SizedBox(
                      child: AutoSizeText(
                        " 4384wddd43",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "362",
                style: TextStyle(color: Color(0xff699BD0), fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
