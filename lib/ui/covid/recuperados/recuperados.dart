import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/recuperados_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';

class RecuperadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RecuperadosViewModel>(
        name: "Recuperados",
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, RecuperadosViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Recuperados"),
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
                                      title: "Recuperados",
                                      leftIndicator:
                                          '${model.atual.casosTotais}',
                                      rightIndicator: UIHelper.formatPercent(
                                          model.atual.percentual),
                                      color: UIStyle.recuperadosColor),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                      title: "Novos em 1 dia",
                                      leftIndicator: '${model.atual.casos}',
                                      color: UIStyle.recuperadosColor),
                                ),
                              ],
                            ),
                            UIHelper.headline("Histórico de casos"),
                            AcumuladosPorDiaChart(model.historicoPorDia,
                                UIStyle.recuperadosColor),
                          ]),
                        ),
                )));
  }
}
