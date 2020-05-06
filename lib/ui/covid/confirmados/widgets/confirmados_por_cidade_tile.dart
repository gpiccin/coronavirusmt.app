import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class ConfirmadosPorCidadeTile extends StatelessWidget {
  final CovidPorCidade covidPorCidade;

  ConfirmadosPorCidadeTile(this.covidPorCidade);

  Widget _buildCard(BuildContext context) {
    return CardHelper.touchableCard(
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(UIStyle.padding),
          child: Text(
            '${covidPorCidade.cidade}',
            style: UITypography.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              UIStyle.padding, 0, UIStyle.padding, UIStyle.padding),
          child: _buildCases(
              this.covidPorCidade.percentualDaCidade, UIStyle.casosColor),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              UIStyle.padding, 0, UIStyle.padding, UIStyle.padding),
          child: _buildBar(),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              UIStyle.padding, 0, UIStyle.padding, UIStyle.padding),
          child: _buildBarA(),
        ),
      ]),
    );
  }

  Widget _buildBar() {
    return Row(
      children: <Widget>[
        _buildLabel(this.covidPorCidade.recuperados.toString(), "Recuperados",
            UIStyle.recuperadosColor),
        _buildLabel(this.covidPorCidade.ativos.toString(), "Ativos",
            UIStyle.contaminadosColor),
        _buildLabel(this.covidPorCidade.obitos.toString(), "Óbitos",
            UIStyle.obitosColor),
      ],
    );
  }

  Widget _buildBarA() {
    return Row(
      children: <Widget>[
        _buildCaseBar(this.covidPorCidade.percentualDeRecuperados,
            UIStyle.recuperadosColor),
        _buildCaseBar(this.covidPorCidade.percentualDeCasosAtivos,
            UIStyle.contaminadosColor),
        _buildCaseBar(
            this.covidPorCidade.percentualDeObitos, UIStyle.obitosColor),
      ],
    );
  }

  double _barWidth(double percent, {double maxWidth = 300}) {
    if (percent == 0) return 0;
    return maxWidth * (percent / 100);
  }

  Widget _buildLabel(String text, String caption, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: UIStyle.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              text,
              style: UITypography.headline.merge(TextStyle(color: color)),
            ),
          ),
          Text(
            caption,
            style: UITypography.overline.merge(TextStyle(color: color)),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseBar(double percent, Color color) {
    double width = _barWidth(percent);

    if (width == 0) return Container();

    return Container(
      height: 10,
      width: width,
      color: color,
    );
  }

  Widget _buildCases(double percent, Color color) {
    double width = _barWidth(percent, maxWidth: 150);

    if (width == 0) return Container();

    return Row(
      children: <Widget>[
        Container(
            height: 10,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(360),
                ))),
        Padding(
          padding: const EdgeInsets.only(left: UIStyle.padding),
          child: Row(
            children: <Widget>[
              _buildLabel(this.covidPorCidade.total.toString(), "Casos", color),
              _buildLabel(
                  UIHelper.formatPercent(this.covidPorCidade.percentualDaCidade,
                      decimal: 2),
                  "do estado",
                  color),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }
}
