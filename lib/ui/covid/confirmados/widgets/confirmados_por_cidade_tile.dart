import 'package:coronavirusmt/core/models/covid_por_cidade.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class ConfirmadosPorCidadeTile extends StatelessWidget {
  final CovidPorCidade covidPorCidade;

  ConfirmadosPorCidadeTile(this.covidPorCidade);

  Widget _buildCard() {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text('${covidPorCidade.cidade}'),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildIndicator(
            '${covidPorCidade.casosTotais}',
            "Casos",
            UIStyle.casosColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                UIStyle.padding + 4, 8, UIStyle.padding + 4, 8),
            child: Text(
              "=",
            ),
          ),
          _buildIndicator(
              '${covidPorCidade.casos}', "Ativos", UIStyle.contaminadosColor),
          _buildIndicator(
              '${covidPorCidade.obitos}', "Óbitos", UIStyle.obitosColor),
          _buildIndicator('${covidPorCidade.recuperados}', "Recuperados",
              UIStyle.recuperadosColor)
        ],
      ),
    );
  }

  Widget _buildIndicator(String value, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.all(UIStyle.padding),
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
