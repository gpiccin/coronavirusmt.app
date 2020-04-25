import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/srag/srag.dart';
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
    return CardHelper.touchableCard(
      InkWell(
        onTap: () => {UIHelper.openPage(context, SragPage())},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: this.defaultPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        color: this.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      width: 3,
                      height: 20,
                    ),
                  ),
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
                ],
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
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                this.indicadorPrincipal,
                                style: UITypography.indicadorPrincipalStyle
                                    .merge(TextStyle(
                                  height: 0.5,
                                  color: this.color,
                                )),
                              )),
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
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                  "SRAG + COVID-19 = ${this.quantidadeDeCasosMaisCOVID}",
                                  style: UITypography.indicadorSecundarioStyle
                                      .merge(TextStyle(
                                          color: this.color, fontSize: 20)))),
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
    );
  }
}
