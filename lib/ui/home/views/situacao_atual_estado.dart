import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/indicadores.dart';
import 'package:flutter/material.dart';

class SituacaoAtualEstadoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<IndicadoresViewModel>(
      name: "Situação atual",
      onModelReady: (model) {
        model.loadData();
      },
      builder:
          (BuildContext context, IndicadoresViewModel model, Widget child) =>
              model.state == ViewState.Busy
                  ? UIHelper.loading()
                  : SingleChildScrollView(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0, UIStyle.padding, 0, 0),
                        child: Column(children: <Widget>[
                          Indicadores(
                            boletim: model.boletim,
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  UIStyle.padding,
                                  UIStyle.padding * 2,
                                  UIStyle.padding,
                                  0),
                              child: Text(
                                "Se puder, fique em casa!",
                                style: UITypography.title,
                                textAlign: TextAlign.center,
                              )),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  UIStyle.padding,
                                  UIStyle.padding * 2,
                                  UIStyle.padding,
                                  0),
                              child: Text(
                                "* Dados de ${UIHelper.fomartDateDMY(model.boletim.data)}. Atualização diária próxima das 18h de acordo com a diponibilidade do boletim oficial da Secretária de Saúde de Mato Grosso.",
                                style: UITypography.overline,
                              )),
                        ]),
                      ),
                    ),
    );
  }
}
