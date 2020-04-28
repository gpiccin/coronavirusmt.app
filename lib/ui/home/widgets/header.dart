import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  Header({this.ultimaAtualizacao, this.referencia, this.boletimUrl});

  final String ultimaAtualizacao;
  final String referencia;
  final String boletimUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: UIStyle.padding),
                  child: Text(
                    "CORONAVÍRUS EM MT",
                    style: GoogleFonts.rubik(
                        color: Color(0xFF353535),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
