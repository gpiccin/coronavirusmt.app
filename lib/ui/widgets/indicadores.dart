import 'package:coronavirusmt/core/models/boletim.dart';
import 'package:coronavirusmt/ui/covid/confirmados/confirmados.dart';
import 'package:coronavirusmt/ui/covid/hospitalizados/hospitalizados.dart';
import 'package:coronavirusmt/ui/covid/isolamento/isolamento.dart';
import 'package:coronavirusmt/ui/covid/recuperados/recuperados.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/covid/obito/obitos.dart';
import 'package:coronavirusmt/ui/srag/srag.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador.dart';
import 'package:flutter/material.dart';

class Indicadores extends StatelessWidget {
  Indicadores({this.boletim});

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
              child: CardIndicador(
                title: "Confirmados",
                leftIndicator: boletim.covidCasos.toString(),
                newCases: boletim.covidNovos,
                color: UIStyle.casosColor,
                page: ConfirmadosPage(boletim.data),
                graphData: boletim.casos,
              ),
            ),
            Expanded(
              flex: 1,
              child: CardIndicador(
                title: "Suspeitos",
                leftIndicator: boletim.sragCasos.toString(),
                newCases: boletim.sragNovos,
                graphData: boletim.srags,
                color: UIStyle.casosColor,
                page: SragPage(),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicador(
                  title: "Hospitalizados",
                  leftIndicator: boletim.covidHospitalizados.toString(),
                  newCases: boletim.covidNovosHospitalizados,
                  percentCases: boletim.covidPercentualDeHospitalizados,
                  graphData: boletim.hospitalizados,
                  color: UIStyle.contaminadosColor,
                  page: HospitalizadosPage(boletim.data)),
            ),
            Expanded(
              flex: 1,
              child: CardIndicador(
                  title: "Em isolamento",
                  leftIndicator: boletim.covidIsolamento.toString(),
                  newCases: boletim.covidNovosEmIsolamento,
                  percentCases: boletim.covidPercentualEmIsolamento,
                  graphData: boletim.isolados,
                  color: UIStyle.contaminadosColor,
                  page: IsolamentoPage()),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: CardIndicador(
                  title: "Óbitos",
                  leftIndicator: boletim.covidObitos.toString(),
                  newCases: boletim.covidNovosObitos,
                  percentCases: boletim.covidPercentualDeObitos,
                  graphData: boletim.obitos,
                  color: UIStyle.obitosColor,
                  page: ObitosPage()),
            ),
            Expanded(
                flex: 1,
                child: CardIndicador(
                    title: "Recuperados",
                    leftIndicator: boletim.covidRecuperados.toString(),
                    newCases: boletim.covidNovosRecuperados,
                    percentCases: boletim.covidPercentualDeRecuperados,
                    graphData: boletim.recuperados,
                    color: UIStyle.recuperadosColor,
                    page: RecuperadosPage())),
          ],
        ),
      ],
    );
  }
}
