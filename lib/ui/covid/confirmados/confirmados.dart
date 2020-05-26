import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/confirmados_view_model.dart';
import 'package:coronavirusmt/ui/covid/confirmados/widgets/confirmados_por_faixa_etaria_chart.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:coronavirusmt/ui/widgets/novos_por_dia_chart.dart';
import 'package:flutter/material.dart';

class ConfirmadosPage extends StatelessWidget {
  final DateTime data;

  ConfirmadosPage(this.data);

  @override
  Widget build(BuildContext context) {
    return BaseView<ConfirmadosViewModel>(
        name: "Confirmados",
        onModelReady: (model) => model.loadData(data),
        builder: (BuildContext context, ConfirmadosViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Casos confirmados"),
                backgroundColor: UIStyle.appBackgroundColor,
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : Padding(
                          padding: const EdgeInsets.all(UIStyle.padding),
                          child: ListView(children: <Widget>[
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
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                      title: "Média de idade",
                                      leftIndicator:
                                          '${model.atual.mediaDeIdade}',
                                      color: UIStyle.casosColor),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),
                            UIHelper.headline("Histórico de casos"),
                            AcumuladosPorDiaChart(
                                model.acumulativoPorDia, UIStyle.casosColorHex),
                            UIHelper.headline("Casos novos por dia"),
                            NovosPorDiaChart(
                                model.casosNovosPorDia, UIStyle.casosColorHex,
                                height: 250),
                            UIHelper.headline("Casos por faixa etária"),
                            ConfirmadosPorFaixaEtariaChart(
                                model.covidPorFaixaEtaria,
                                height: (model.covidPorFaixaEtaria.length *
                                        UIStyle.barChartBarHeight)
                                    .toDouble()),
                          ]),
                        ),
                )));
  }
}
