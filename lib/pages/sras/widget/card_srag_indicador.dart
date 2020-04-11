import 'package:covidmt/pages/sras/srars_panel.dart';
import 'package:covidmt/ui/card_style.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:flutter/material.dart';

class CardSRAGIndicador extends StatelessWidget {
  CardSRAGIndicador(this.title, this.indicadorPrincipal,
      this.quantidadeDeCasosEmRelacaoAoCOVID, this.quantidadeDeCasosMaisCOVID,
      [this.color]);

  final String title;
  final String indicadorPrincipal;
  final String quantidadeDeCasosMaisCOVID;
  final String quantidadeDeCasosEmRelacaoAoCOVID;
  final double defaultPadding = 12.0;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: cardElevation,
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () => {Navigator.push(context, SrarsPage())},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(this.defaultPadding,
                    this.defaultPadding, this.defaultPadding, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "SRAG - Síndrome respiratória aguda grave",
                    style: cardTituloStyle,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: this.defaultPadding),
                        height: 50,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            this.indicadorPrincipal,
                            style: TextStyle(
                              height: 0.5,
                              color: this.color,
                            ).merge(cardIndicadorPrincipalStyle),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: this.defaultPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "SRAG + COVID-19 = ",
                                style: TextStyle(color: this.color)
                                    .merge(cardIndicadorSecundarioStyle),
                              ),
                              Text(
                                "430",
                                style: cardIndicadorSecundarioStyle.merge(
                                    TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: EdgeInsets.only(left: this.defaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Total no período de: 01/01/2020 até 09/04/2020",
                      style: cardLegendaStyle,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "SRAG são casos suspeitos de COVID-19",
                      style: cardLegendaStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: this.defaultPadding,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
