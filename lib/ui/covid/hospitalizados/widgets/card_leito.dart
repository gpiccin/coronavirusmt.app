import 'package:coronavirusmt/core/models/covid_por_tipo_de_leito.dart';
import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class CardLeito extends StatelessWidget {
  CardLeito(
      {this.title,
      this.indicadorPrincipal,
      this.color = Colors.black,
      this.page,
      this.casos});

  final List<CovidPorTipoDeLeito> casos;
  final String title;
  final String indicadorPrincipal;
  final Color color;
  final Widget page;

  Widget _buildRow(CovidPorTipoDeLeito caso) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        "${caso.rede}: ${caso.casosTotais}",
        style: UITypography.body1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardHelper.touchableCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                UIStyle.padding, UIStyle.padding, UIStyle.padding, 0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                this.title,
                style: UITypography.title,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: UIStyle.padding),
              height: 50,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      this.indicadorPrincipal,
                      style:
                          UITypography.indicadorPrincipalStyle.merge(TextStyle(
                        color: this.color,
                      )),
                    )),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                UIStyle.padding, UIStyle.padding + 8, UIStyle.padding, 0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "Redes de atendimento",
                style: UITypography.title,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                UIStyle.padding + 4, 0, UIStyle.padding + 4, 0),
            child: Divider(),
          ),
          Container(
            height: 100,
            alignment: Alignment.topLeft,
            child: ListView.builder(
              itemCount: casos.length,
              padding:
                  EdgeInsets.fromLTRB(UIStyle.padding, 0, UIStyle.padding, 0),
              itemBuilder: (BuildContext context, int i) {
                return _buildRow(casos.elementAt(i));
              },
            ),
          )
        ],
      ),
    );
  }
}
