import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/covid/widgets/covid_indicadores.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/srag/srag.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_simples.dart';
import 'package:flutter/material.dart';

class SituacaoAtualEstadoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<IndicadoresViewModel>(
      name: "Situação atual",
      onModelReady: (model) {
        model.loadData();
      },
      builder: (BuildContext context, IndicadoresViewModel model,
              Widget child) =>
          model.state == ViewState.Busy
              ? UIHelper.loading()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, UIStyle.padding, 0, 0),
                  child:
                      ListView(padding: EdgeInsets.all(0), children: <Widget>[
                    CovidIndicadores(
                      boletim: model.boletim,
                    ),
                    UIHelper.divider(),
                    CardIndicadorSimples(
                      title: "SRAG - Síndrome respiratória aguda grave",
                      leftIndicator: model.boletim.sragCasos.toString(),
                      rightIndicator:
                          UIHelper.formatDifference(model.boletim.sragNovos),
                      color: Color(0xFF1976d2),
                      page: SragPage(),
                    ),
                    UIHelper.divider(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(
                            UIStyle.padding, 0, UIStyle.padding, 0),
                        child: Text(
                          "* Dados de ${UIHelper.fomartDateDMY(model.boletim.data)}. Atualização diária próxima das 18h de acordo com a diponibilidade do boletim oficial da Secretária de Saúde de Mato Grosso.",
                          style: UITypography.overline,
                        )),
                  ]),
                ),
    );
  }
}
