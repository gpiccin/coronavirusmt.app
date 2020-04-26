import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/srag_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/srag/widget/srag_acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_informacao_simples.dart';
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
                          padding: const EdgeInsets.all(UIStyle.defaultPadding),
                          child: ListView(children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Confirmados",
                                          principalIndicator:
                                              '${model.atual.casosTotais}',
                                          color: UIStyle.casosColor),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Novos em 1 dia",
                                          principalIndicator:
                                              '${model.atual.casos}',
                                          color: UIStyle.casosColor),
                                    ),
                                  ],
                                ),
                                CardInformacaoSimples(
                                  title: "COVID + SRAG",
                                  principalIndicator:
                                      '${model.atual.covidMaisSrag}',
                                  indicatorLabel:
                                      '= (${model.atual.casosTotais} + ${model.atual.covidCasosTotais})',
                                  color: UIStyle.casosColor,
                                  caption:
                                      'O número de SRAG representa ${UIHelper.formatPercent(model.atual.percentualEmRelacaoAoCovid)} a mais do que os casos confirmados de Covid-19.',
                                ),
                                UIHelper.headline("Crescimento de casos"),
                                SragAcumuladosPorDiaChart(
                                    model.historicoPorDia),
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
