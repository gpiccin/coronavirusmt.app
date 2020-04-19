import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/viewmodels/covid/confirmados_view_model.dart';
import 'package:covidmt/ui/covid/confirmados/widgets/confirmados_acumulados_por_dia_chart.dart';
import 'package:covidmt/ui/shared/base_view.dart';
import 'package:covidmt/ui/shared/ui_helpers.dart';
import 'package:covidmt/ui/shared/ui_style.dart';
import 'package:covidmt/ui/covid/obito/widgets/obitos_acumulados_por_dia_chart.dart';
import 'package:covidmt/ui/widgets/card_informacao_simples.dart';
import 'package:flutter/material.dart';

class ConfirmadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ConfirmadosViewModel>(
        onModelReeady: (model) => model.getData(),
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
                                          title: "Novos casos",
                                          indicadorPrincipal:
                                              '${model.atual.casos}',
                                          color: UIStyle.casosColor),
                                    ),
                                  ],
                                ),
                                UIHelper.headline("Crescimento de casos"),
                                ConfirmadosAcumuladosPorDiaChart(
                                    model.historicoPorDia),
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
