import 'package:covidmt/shared/screen.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.getWidth(context),
      height: Screen.getHeigh(context) / 3.5,
      decoration: BoxDecoration(
          color: Color(0xff1E347C),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: Screen.getHeigh(context) / 10,
          ),
          Text(
            "Mato Grosso",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Situação epidemologica SRAG e COVID-19",
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: Screen.getWidth(context) / 2),
            child: Text(
              "Ultima atualização:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Screen.getWidth(context) / 2),
            child: Text(
              "Boletim Informativo n:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
