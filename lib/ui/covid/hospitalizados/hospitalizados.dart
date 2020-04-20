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
        onModelReeady: (model) => model.getData(this.data),
        builder: (BuildContext context, HospitalizadosViewModel model,
                Widget child) =>
            Scaffold(
                appBar: UIHelper.pageAppBar("Hospitalizados"),
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : Padding(
                          padding: const EdgeInsets.all(UIStyle.defaultPadding),
                          child: ListView(children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                CardInformacaoSimples(
                                    title: "Hospitalizados",
                                    indicadorPrincipal:
                                        '${model.hospitalizados}',
                                    color: UIStyle.contaminadosColor),
                                SizedBox(
                                  height: UIStyle.defaultPadding,
                                ),
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
                                    SizedBox(
                                      width: 12,
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
