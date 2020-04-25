import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/covid/obito/widgets/obitos_acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/covid/obito/widgets/obitos_por_cidade_chart.dart';
import 'package:coronavirusmt/ui/covid/obito/widgets/obitos_por_comorbidade_chart.dart';
import 'package:coronavirusmt/ui/covid/obito/widgets/obitos_por_faixa_etaria_chart.dart';
import 'package:coronavirusmt/ui/covid/obito/widgets/obitos_por_sexo_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_informacao_simples.dart';
import 'package:flutter/material.dart';

class ObitosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ObitosViewModel>(
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, ObitosViewModel model, Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Óbitos"),
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
                                          title: "Óbitos",
                                          principalIndicator:
                                              '${model.totalDeObitos}',
                                          indicatorLabel: "vítimas",
                                          color: UIStyle.obitosColor),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Média de idade",
                                          principalIndicator:
                                              '${model.mediaDeIdade}',
                                          indicatorLabel: "anos",
                                          color: UIStyle.obitosColor),
                                    ),
                                  ],
                                ),
                                UIHelper.headline("Óbitos acumulados por dia"),
                                ObitosAcumuladosPorDiaChart(
                                    model.obitosAcumuladosPorDia),
                                UIHelper.headline("Óbitos por faixa etária"),
                                ObitosPorFaixaEtariaChart(
                                    model.obitosPorFaixaEtaria),
                                UIHelper.headline("Óbitos por cidade"),
                                ObitosPorCidadeChart(model.obitosPorCidade),
                                UIHelper.headline("Óbitos por sexo"),
                                ObitosPorSexoChart(model.obitosPorSexo),
                                UIHelper.headline("Óbitos por comorbidade"),
                                ObitosPorComorbidade(
                                    model.obitosPorComorbidade),
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
