import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/model/obito_model.dart';
import 'package:covidmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:covidmt/pages/base_view.dart';
import 'package:covidmt/pages/covid/widget/obitos_por_faixa_etaria_chart.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_helpers.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosPage extends StatelessWidget {
  Widget buildRow(Obito obito) {
    return ListTile(
      title: Text(
        '${obito.idade} anos em ${obito.cidade}',
        style: listTileTitle,
      ),
      subtitle: Text(
          'Óbito: ${UIHelper.fomartDate(obito.data)} - Comorbidade: ${obito.comorbidade}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ObitosViewModel>(
        onModelReeady: (model) => model.getObitos(),
        builder: (BuildContext context, ObitosViewModel model, Widget child) =>
            Scaffold(
                appBar: AppBar(
                  backgroundColor: UIStyle.headerBackgroundColor,
                  elevation: 0,
                  title: Text(
                    "Óbitos",
                  ),
                ),
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : ListView(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 12,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      UIStyle.defaultPadding,
                                      UIStyle.defaultPadding,
                                      UIStyle.defaultPadding,
                                      0),
                                  child: Text(
                                    "Óbitos por faixa etária",
                                    style: headerStyle,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child: ObitosPorFaixaEtariaChart(
                                      model.obitosPorFaixaEtaria),
                                ),
                              ),
                            ],
                          ),
                        ]),
                )));
  }
}

// ListView.builder(
//                                 itemCount: model.obitos.length,
//                                 padding: const EdgeInsets.all(16.0),
//                                 itemBuilder: (BuildContext context, int i) {
//                                   return buildRow(model.obitos.elementAt(i));
//                                 },
//                               )
