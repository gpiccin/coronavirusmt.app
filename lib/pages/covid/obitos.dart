import 'package:covidmt/core/enum/viewstate.dart';
import 'package:covidmt/core/model/obito_model.dart';
import 'package:covidmt/core/viewmodels/covid/obitos_view_model.dart';
import 'package:covidmt/pages/base_view.dart';
import 'package:covidmt/pages/covid/widget/card_informacao_simples.dart';
import 'package:covidmt/pages/covid/widget/obitos_acumulados_por_dia_chart.dart';
import 'package:covidmt/pages/covid/widget/obitos_por_cidade_chart.dart';
import 'package:covidmt/pages/covid/widget/obitos_por_comorbidade_chart.dart';
import 'package:covidmt/pages/covid/widget/obitos_por_faixa_etaria_chart.dart';
import 'package:covidmt/pages/covid/widget/obitos_por_sexo_chart.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:covidmt/ui/ui_helpers.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';

class ObitosPage extends StatelessWidget {
  Widget _buildRow(Obito obito) {
    return ListTile(
      title: Text(
        '${obito.idade} anos em ${obito.cidade}',
        style: listTileTitle,
      ),
      subtitle: Text(
          'Óbito: ${UIHelper.fomartDateDMY(obito.data)} - Comorbidade: ${obito.comorbidade}'),
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(UIStyle.defaultPadding,
          UIStyle.defaultPadding + 12, UIStyle.defaultPadding, 0),
      child: Text(
        title,
        style: headerStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ObitosViewModel>(
        onModelReeady: (model) => model.getObitos(),
        builder: (BuildContext context, ObitosViewModel model, Widget child) =>
            Scaffold(
                appBar: UIHelper.pageAppBar("Óbitos"),
                body: Container(
                  child: model.state == ViewState.Busy
                      ? UIHelper.loading()
                      : ListView(children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    UIStyle.defaultPadding,
                                    UIStyle.defaultPadding,
                                    UIStyle.defaultPadding,
                                    0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Óbitos",
                                          indicadorPrincipal:
                                              '${model.totalDeObitos}',
                                          indicadorSecundario: "vítimas",
                                          color: UIStyle.obitosColor),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: CardInformacaoSimples(
                                          title: "Média de idade",
                                          indicadorPrincipal:
                                              '${model.mediaDeIdade}',
                                          indicadorSecundario: "anos",
                                          color: UIStyle.obitosColor),
                                    ),
                                  ],
                                ),
                              ),
                              this._title("Óbitos acumulados por dia"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child: ObitosAcumuladosPorDiaChart(
                                      model.obitosAcumuladosPorDia),
                                ),
                              ),
                              this._title("Óbitos por faixa etária"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child: ObitosPorFaixaEtariaChart(
                                      model.obitosPorFaixaEtaria),
                                ),
                              ),
                              this._title("Óbitos por cidade"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child: ObitosPorCidadeChart(
                                      model.obitosPorCidade),
                                ),
                              ),
                              this._title("Óbitos por sexo"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child:
                                      ObitosPorSexoChart(model.obitosPorSexo),
                                ),
                              ),
                              this._title("Óbitos por comorbidade"),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  height: 200,
                                  child: ObitosPorComorbidade(
                                      model.obitosPorComorbidade),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
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
