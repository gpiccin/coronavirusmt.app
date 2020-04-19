import 'package:covidmt/ui/base/card_style.dart';
import 'package:covidmt/ui/pages/sras/srars_panel.dart';
import 'package:covidmt/ui/base/ui_typography.dart';
import 'package:flutter/material.dart';

class CardSRAGIndicador extends StatelessWidget {
  CardSRAGIndicador(
      {this.title,
      this.indicadorPrincipal,
      this.quantidadeDeCasosMaisCOVID,
      this.color});

  final String title;
  final String indicadorPrincipal;
  final String quantidadeDeCasosMaisCOVID;
  final double defaultPadding = 12.0;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: cardElevation,
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SrarsPage()))
        },
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
                    style: UITypography.title,
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
                            style: UITypography.indicadorPrincipalStyle
                                .merge(TextStyle(
                              height: 0.5,
                              color: this.color,
                            )),
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
                              Text("SRAG + COVID-19 = ",
                                  style: UITypography.indicadorSecundarioStyle
                                      .merge(TextStyle(
                                          color: this.color, fontSize: 20))),
                              Text(
                                quantidadeDeCasosMaisCOVID,
                                style: UITypography.indicadorSecundarioStyle
                                    .merge(TextStyle(
                                        color: this.color,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
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
                      title,
                      style: UITypography.caption,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "SRAG são casos suspeitos de COVID-19",
                      style: UITypography.caption,
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
