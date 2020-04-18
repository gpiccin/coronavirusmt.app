import 'package:covidmt/core/model/boletim_model.dart';
import 'package:flutter/material.dart';

import 'card_indicador_simples.dart';

class GridCovidIndicadores extends StatelessWidget {
  GridCovidIndicadores({this.boletim});

  final BoletimModel boletim;
  final double defaultSizeCardSeparation = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Casos confirmados",
                  indicadorPrincipal: boletim.covidCasos.toString(),
                  color: Color(0xFF1976d2)),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Recuperados",
                  indicadorPrincipal: boletim.covidRecuperados.toString(),
                  indicadorSecundario:
                      boletim.covidPercentualDeRecuperados.toString() + "%",
                  color: Color(0xFF4CAF50)),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Hospitalizados",
                  indicadorPrincipal: boletim.covidHospitalizados.toString(),
                  indicadorSecundario:
                      boletim.covidPercentualDeHospitalizados.toString() + "%",
                  color: Color(0xFFFF9800)),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Isolamento domiciliar",
                  indicadorPrincipal: boletim.covidIsolamento.toString(),
                  indicadorSecundario:
                      boletim.covidPercentualEmIsolamento.toString() + "%",
                  color: Color(0xFFFF9800)),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Óbitos",
                  indicadorPrincipal: boletim.covidObitos.toString(),
                  indicadorSecundario:
                      boletim.covidPercentualDeObitos.toString() + "%",
                  color: Color(0xFFD32F2F)),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ],
    );
  }
}
