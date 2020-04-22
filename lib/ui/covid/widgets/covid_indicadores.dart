import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/ui/covid/confirmados/confirmados.dart';
import 'package:coronavirusmt/ui/covid/hospitalizados/hospitalizados.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/covid/obito/obitos.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';

class CovidIndicadores extends StatelessWidget {
  CovidIndicadores({this.boletim});

  final Boletim boletim;
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
                principalIndicator: boletim.covidCasos.toString(),
                color: UIStyle.casosColor,
                page: ConfirmadosPage(boletim.data),
              ),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Recuperados",
                  principalIndicator: boletim.covidRecuperados.toString(),
                  secondIndicator: UIHelper.formatPercent(
                      boletim.covidPercentualDeRecuperados),
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
                  principalIndicator: boletim.covidHospitalizados.toString(),
                  secondIndicator: UIHelper.formatPercent(
                      boletim.covidPercentualDeHospitalizados),
                  color: UIStyle.contaminadosColor,
                  page: HospitalizadosPage(boletim.data)),
            ),
            SizedBox(
              width: this.defaultSizeCardSeparation,
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Isolamento domiciliar",
                  principalIndicator: boletim.covidIsolamento.toString(),
                  secondIndicator: UIHelper.formatPercent(
                      boletim.covidPercentualEmIsolamento),
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
                  principalIndicator: boletim.covidObitos.toString(),
                  secondIndicator:
                      UIHelper.formatPercent(boletim.covidPercentualDeObitos),
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
