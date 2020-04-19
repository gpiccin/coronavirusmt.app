import 'package:covidmt/core/models/boletim_model.dart';
import 'package:covidmt/ui/covid/confirmados/confirmados.dart';
import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:covidmt/ui/covid/obito/obitos.dart';
import 'package:covidmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';

class CovidIndicadores extends StatelessWidget {
  CovidIndicadores({this.boletim});

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
                color: UIStyle.casosColor,
                page: ConfirmadosPage(),
              ),
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
                  color: UIStyle.recuperadosColor),
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
                  color: UIStyle.contaminadosColor),
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
                  color: UIStyle.contaminadosColor),
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
                  color: UIStyle.obitosColor,
                  page: ObitosPage()),
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