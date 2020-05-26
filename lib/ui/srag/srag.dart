import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/srag_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:coronavirusmt/ui/widgets/novos_por_dia_chart.dart';
import 'package:flutter/material.dart';

class SragPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SragViewModel>(
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, SragViewModel model, Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Síndrome respiratória aguda grave"),
                backgroundColor: UIStyle.appBackgroundColor,
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : Padding(
                          padding: const EdgeInsets.all(UIStyle.padding),
                          child: ListView(children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: CardIndicadorSimples(
                                          title: "Confirmados",
                                          leftIndicator:
                                              '${model.atual.casosTotais}',
                                          color: UIStyle.casosColor),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardIndicadorSimples(
                                          title: "Novos em 1 dia",
                                          leftIndicator: '${model.atual.casos}',
                                          color: UIStyle.casosColor),
                                    ),
                                  ],
                                ),
                                CardIndicadorSimples(
                                  title: "COVID + SRAG",
                                  leftIndicator: '${model.atual.covidMaisSrag}',
                                  rightIndicator:
                                      'SRAG: ${model.atual.casosTotais} + COVID: ${model.atual.covidCasosTotais}',
                                  color: UIStyle.casosColor,
                                  caption:
                                      'O número de SRAG representa ${UIHelper.formatPercent(model.atual.percentualEmRelacaoAoCovid)} a mais do que os casos confirmados de Covid-19.',
                                ),
                                UIHelper.headline("Histórico de casos"),
                                AcumuladosPorDiaChart(model.historicoPorDia,
                                    UIStyle.casosColorHex),
                                UIHelper.headline("Casos novos por dia"),
                                NovosPorDiaChart(model.casosNovosPorDia,
                                    UIStyle.casosColorHex,
                                    height: 250),
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
