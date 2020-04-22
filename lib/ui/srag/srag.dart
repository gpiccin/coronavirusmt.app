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
                appBar:
                    UIHelper.pageAppBar("Síndrome respiratória aguda grave"),
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
                                          title: "Casos confirmados",
                                          indicadorPrincipal:
                                              '${model.atual.casosTotais}',
                                          color: UIStyle.casosColor),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "COVID + SRAG",
                                          indicadorPrincipal:
                                              '${model.atual.covidMaisSrag}',
                                          color: UIStyle.casosColor),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: UIStyle.defaultPadding),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: CardInformacaoSimples(
                                            title: "Novos casos em 1 dia",
                                            indicadorPrincipal:
                                                '${model.atual.casos}',
                                            color: UIStyle.casosColor),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(flex: 1, child: Container()),
                                    ],
                                  ),
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
