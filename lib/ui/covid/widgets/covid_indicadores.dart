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
                title: "Confirmados",
                leftIndicator: boletim.covidCasos.toString(),
                rightIndicator: UIHelper.formatDifference(boletim.covidNovos),
                color: UIStyle.casosColor,
                page: ConfirmadosPage(boletim.data),
              ),
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Recuperados",
                  leftIndicator: boletim.covidRecuperados.toString(),
                  rightIndicator:
                      UIHelper.formatDifference(boletim.covidNovosRecuperados),
                  color: UIStyle.recuperadosColor),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Hospitalizados",
                  leftIndicator: boletim.covidHospitalizados.toString(),
                  rightIndicator: UIHelper.formatDifference(
                      boletim.covidNovosHospitalizados),
                  color: UIStyle.contaminadosColor,
                  page: HospitalizadosPage(boletim.data)),
            ),
            Expanded(
              flex: 1,
              child: CardIndicadorSimples(
                  title: "Em isolamento",
                  leftIndicator: boletim.covidIsolamento.toString(),
                  rightIndicator:
                      UIHelper.formatDifference(boletim.covidNovosEmIsolamento),
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
                  leftIndicator: boletim.covidObitos.toString(),
                  rightIndicator:
                      UIHelper.formatDifference(boletim.covidNovosObitos),
                  color: UIStyle.obitosColor,
                  page: ObitosPage()),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ],
    );
  }
}
