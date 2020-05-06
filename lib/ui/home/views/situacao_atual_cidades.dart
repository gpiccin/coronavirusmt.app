import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/cidades_view_model.dart';
import 'package:coronavirusmt/ui/covid/confirmados/widgets/confirmados_por_cidade_card.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SituacaoAtualCidadesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CidadesViewModel>(
        name: "Cidades",
        onModelReady: (model) => model.loadData(),
        builder: (BuildContext context, CidadesViewModel model, Widget child) =>
            model.state == ViewState.Busy
                ? UIHelper.loading()
                : Padding(
                    padding:
                        const EdgeInsets.fromLTRB(0, UIStyle.padding, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: CardIndicadorSimples(
                                title: "Afetadas",
                                leftIndicator:
                                    model.totais.cidadesComCasos.toString(),
                                color: UIStyle.casosColor,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CardIndicadorSimples(
                                title: "Ativas",
                                leftIndicator: model
                                    .totais.cidadesComCasosAtivos
                                    .toString(),
                                color: UIStyle.contaminadosColor,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: CardIndicadorSimples(
                                title: "Com óbitos",
                                leftIndicator:
                                    model.totais.cidadesComObitos.toString(),
                                color: UIStyle.obitosColor,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: PagewiseListView(
                            pageSize: 10,
                            itemBuilder: (context, covidPorCidade, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: ConfirmadosPorCidadeCard(
                                        covidPorCidade),
                                  ),
                                ),
                              ); //ConfirmadosPorCidadeTile(covidPorCidade);
                            },
                            pageFuture: (pageIndex) {
                              return model.getCovidPorCidade(10, pageIndex);
                            },
                            loadingBuilder: (context) {
                              return UIHelper.loading();
                            },
                          ),
                        ),
                      ],
                    ),
                  ));
  }
}
