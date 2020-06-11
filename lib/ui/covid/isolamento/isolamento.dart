import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/isolamento_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';

class IsolamentoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<IsolamentoViewModel>(
        name: "Em isolamento",
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, IsolamentoViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Em isolamento"),
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
                                      title: "Isolados",
                                      leftIndicator:
                                          '${model.atual.casosTotais}',
                                      rightIndicator: UIHelper.formatPercent(
                                          model.atual.percentual),
                                      color: UIStyle.contaminadosColor),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                      title: "Novos em 1 dia",
                                      leftIndicator: '${model.atual.casos}',
                                      color: UIStyle.contaminadosColor),
                                ),
                              ],
                            ),
                            UIHelper.headline("Histórico de casos"),
                            AcumuladosPorDiaChart(model.historicoPorDia,
                                UIStyle.contaminadosColor),
                          ]),
                        ),
                )));
  }
}
