import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/acumulados_por_dia_chart.dart';
import 'package:coronavirusmt/ui/widgets/bar_chart.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:coronavirusmt/ui/widgets/novos_por_dia_chart.dart';
import 'package:flutter/material.dart';

class ObitosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<ObitosViewModel>(
        name: "Óbitos",
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, ObitosViewModel model, Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Óbitos"),
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
                                    title: "Óbitos",
                                    leftIndicator: '${model.totalDeObitos}',
                                    color: UIStyle.obitosColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                    title: "Registros em 1 dia",
                                    leftIndicator: model
                                        .boletim.covidNovosObitos
                                        .toString(),
                                    color: UIStyle.obitosColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                    title: "Taxa de mortalidade",
                                    leftIndicator: UIHelper.formatPercent(
                                        model.boletim.covidPercentualDeObitos),
                                    color: UIStyle.obitosColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: CardIndicadorSimples(
                                      title: "Média de idade",
                                      leftIndicator: '${model.mediaDeIdade}',
                                      color: UIStyle.obitosColor),
                                ),
                              ],
                            ),
                            UIHelper.headline("Óbitos registrados por dia"),
                            AcumuladosPorDiaChart(
                                model.obitosRegistradosAcumuladosPorDia,
                                UIStyle.obitosColor),
                            UIHelper.headline("Óbitos registrados por dia"),
                            NovosPorDiaChart(model.obitosRegistradosPorDia,
                                UIStyle.obitosColor),
                            UIHelper.headline("Óbitos por dia"),
                            AcumuladosPorDiaChart(model.obitosAcumuladosPorDia,
                                UIStyle.obitosColor),
                            UIHelper.headline("Óbitos por dia"),
                            NovosPorDiaChart(
                                model.obitosPorDia, UIStyle.obitosColor,
                                height: 200),
                            UIHelper.headline("Óbitos por faixa etária"),
                            BarChart(
                                model.obitosPorFaixaEtaria, UIStyle.obitosColor,
                                height: (model.obitosPorFaixaEtaria.length *
                                        UIStyle.barChartBarHeight)
                                    .toDouble()),
                            UIHelper.headline("Óbitos por sexo"),
                            BarChart(model.obitosPorSexo, UIStyle.obitosColor),
                            UIHelper.headline("Óbitos por cidade"),
                            BarChart(model.obitosPorCidade, UIStyle.obitosColor,
                                height: (model.obitosPorCidade.length *
                                        UIStyle.barChartBarHeight)
                                    .toDouble()),
                            UIHelper.headline("Óbitos por comorbidade"),
                            BarChart(
                                model.obitosPorComorbidade, UIStyle.obitosColor,
                                height: (model.obitosPorComorbidade.length *
                                        UIStyle.barChartBarHeight)
                                    .toDouble()),
                          ]),
                        ),
                )));
  }
}
