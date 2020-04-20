import 'package:coronavirusmt/core/enum/viewstate.dart';
import 'package:coronavirusmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:coronavirusmt/ui/shared/base_view.dart';
import 'package:coronavirusmt/ui/covid/widgets/covid_indicadores.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/sras/widget/card_srag_indicador.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SituacaoAtualView extends StatelessWidget {
  _launchBoletimURL(boletimUrl) async {
    if (await canLaunch(boletimUrl)) {
      await launch(boletimUrl);
    } else {
      throw 'Não foi possível abrir o boletim $boletimUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<IndicadoresViewModel>(
      onModelReeady: (model) => model.getBoletim(),
      builder: (BuildContext context, IndicadoresViewModel model,
              Widget child) =>
          Container(
              child: model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            UIStyle.defaultPadding,
                            0,
                            UIStyle.defaultPadding,
                            UIStyle.defaultPadding),
                        child: Container(
                          child:
                              ListView(padding: EdgeInsets.all(0), children: <
                                  Widget>[
                            GestureDetector(
                                child: Row(
                                  children: <Widget>[],
                                ),
                                onTap: () {
                                  _launchBoletimURL(model.boletim.link);
                                }),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "COVID-19",
                                      style: UITypography.headline,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Text(
                                        UIHelper.fomartDateDMY(
                                            model.boletim.data),
                                        style: UITypography.subtitle),
                                  ),
                                  Icon(Icons.event,
                                      color: Colors.grey, size: 20)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: UIStyle.defaultPadding,
                            ),
                            CovidIndicadores(
                              boletim: model.boletim,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  UIStyle.defaultPadding + 4,
                                  0,
                                  UIStyle.defaultPadding + 4,
                                  0),
                              child: Divider(),
                            ),
                            CardSRAGIndicador(
                              title: "SRAG - 01/01/2020 até " +
                                  UIHelper.fomartDateDMY(model.boletim.data),
                              indicadorPrincipal:
                                  model.boletim.sragCasos.toString(),
                              quantidadeDeCasosMaisCOVID:
                                  (model.boletim.covidCasos +
                                          model.boletim.sragCasos)
                                      .toString(),
                              color: Color(0xFF1976d2),
                            ),
                          ]),
                        ),
                      ),
                    )),
    );
  }
}
