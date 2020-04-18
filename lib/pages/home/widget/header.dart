import 'package:covidmt/ui/ui_style.dart';
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
      height: 140,
      decoration: BoxDecoration(
          color: headerBackgroundColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
