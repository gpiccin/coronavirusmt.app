import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/confirmados_view_model.dart';
import 'package:coronavirusmt/ui/covid/confirmados/widgets/confirmados_acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/covid/confirmados/widgets/confirmados_por_cidade_chart.dart';
import 'package:coronavirusmt/ui/covid/confirmados/widgets/confirmados_por_faixa_etaria_chart.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/card_informacao_simples.dart';
import 'package:flutter/material.dart';

class ConfirmadosPage extends StatelessWidget {
  final DateTime data;

  ConfirmadosPage(this.data);

  @override
  Widget build(BuildContext context) {
    return BaseView<ConfirmadosViewModel>(
        onModelReeady: (model) => model.getData(data),
        builder: (BuildContext context, ConfirmadosViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.pageAppBar("Casos confirmados"),
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
                                          title: "Novos casos em 1 dia",
                                          indicadorPrincipal:
                                              '${model.atual.casos}',
                                          color: UIStyle.casosColor),
                                    ),
                                  ],
                                ),
                                UIHelper.headline("Crescimento de casos"),
                                ConfirmadosAcumuladosPorDiaChart(
                                    model.historicoPorDia),
                                UIHelper.headline("Casos por faixa etária"),
                                ConfirmadosPorFaixaEtariaChart(
                                    model.covidPorFaixaEtaria),
                                UIHelper.headline(
                                    "Top 10 cidades em número de casos"),
                                ConfirmadosPorCidadeChart(
                                  model.covidPorCidade,
                                  height: 400,
                                ),
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
