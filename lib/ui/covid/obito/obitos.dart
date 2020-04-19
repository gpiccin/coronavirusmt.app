import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:covidmt/ui/shared/base_view.dart';
import 'package:covidmt/ui/shared/ui_helpers.dart';
import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_acumulados_por_dia_chart.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_por_cidade_chart.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_por_comorbidade_chart.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_por_faixa_etaria_chart.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_por_sexo_chart.dart';
import 'package:covidmt/ui/widgets/card_informacao_simples.dart';
import 'package:flutter/material.dart';

class ObitosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ObitosViewModel>(
        onModelReeady: (model) => model.getObitos(),
        builder: (BuildContext context, ObitosViewModel model, Widget child) =>
            Scaffold(
                appBar: UIHelper.pageAppBar("Óbitos"),
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
                                          indicadorPrincipal:
                                              '${model.totalDeObitos}',
                                          indicadorSecundario: "vítimas",
                                          color: UIStyle.obitosColor),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Média de idade",
                                          indicadorPrincipal:
                                              '${model.mediaDeIdade}',
                                          indicadorSecundario: "anos",
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
