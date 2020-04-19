import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:covidmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  Header({this.ultimaAtualizacao, this.referencia, this.boletimUrl});

  final String ultimaAtualizacao;
  final String referencia;
  final String boletimUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      color: UIStyle.headerBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              "CORONAVÍRUS EM MT",
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Situação epidemologica SRAG e COVID-19",
              style: UITypography.title.merge(TextStyle(
                color: Colors.white,
              )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 25,
            decoration: BoxDecoration(
                color: UIStyle.appBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
          ),
        ],
      ),
    );
  }
}