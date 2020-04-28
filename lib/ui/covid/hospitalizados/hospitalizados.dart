import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/hospitalizados_view_model.dart';
import 'package:coronavirusmt/ui/covid/hospitalizados/widgets/card_leito.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/widgets/card_informacao_simples.dart';
import 'package:flutter/material.dart';

class HospitalizadosPage extends StatelessWidget {
  final DateTime data;

  HospitalizadosPage(this.data);
  @override
  Widget build(BuildContext context) {
    return BaseView<HospitalizadosViewModel>(
        name: "Hospitalizados",
        onModelReady: (model) => model.loadData(this.data),
        builder: (BuildContext context, HospitalizadosViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.appBar("Hospitalizados"),
                backgroundColor: UIStyle.appBackgroundColor,
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : Padding(
                          padding: const EdgeInsets.all(UIStyle.padding),
                          child: ListView(children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                CardInformacaoSimples(
                                    title: "Hospitalizados",
                                    principalIndicator:
                                        '${model.hospitalizados}',
                                    color: UIStyle.contaminadosColor),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: CardLeito(
                                        title: "UTI",
                                        indicadorPrincipal: '${model.utiTotal}',
                                        color: UIStyle.utiColor,
                                        casos: model.uti,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardLeito(
                                        title: "Enfermaria",
                                        indicadorPrincipal:
                                            '${model.enfermariaTotal}',
                                        color: UIStyle.contaminadosColor,
                                        casos: model.enfermaria,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                )));
  }
}
