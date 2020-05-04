import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class ConfirmadosPorCidadeTile2 extends StatelessWidget {
  final CovidPorCidade covidPorCidade;

  ConfirmadosPorCidadeTile2(this.covidPorCidade);

  Widget _buildCard() {
    return Container(
        decoration: CardHelper.boxDecoration(),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: UIStyle.padding),
              child: Container(
                color: Colors.amberAccent,
                height: 50,
                width: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  0, UIStyle.padding, 0, UIStyle.padding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          UIStyle.padding, 0, 0, UIStyle.padding),
                      child: Text(
                        '${covidPorCidade.cidade}',
                        style: UITypography.title,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildIndicator(
                          '${covidPorCidade.casosTotais}',
                          "Casos",
                          UIStyle.casosColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              UIStyle.padding, 8, UIStyle.padding, 8),
                          child: Text(
                            "=",
                          ),
                        ),
                        _buildIndicator('${covidPorCidade.casos}', "Ativos",
                            UIStyle.contaminadosColor),
                        _buildIndicator('${covidPorCidade.obitos}', "Óbitos",
                            UIStyle.obitosColor),
                        _buildIndicator('${covidPorCidade.recuperados}',
                            "Recuperados", UIStyle.recuperadosColor)
                      ],
                    )
                  ]),
            ),
          ],
        ));
  }

  Widget _buildIndicator(String value, String label, Color color) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(UIStyle.padding, 0, UIStyle.padding, 0),
      child: Column(
        children: <Widget>[
          Text(
            value,
            style: UITypography.headline.merge(TextStyle(color: color)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: UITypography.caption,
            softWrap: false,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }
}
