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
                  Container(
                    height: 29,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(this.defaultPadding - 2,
                          this.defaultPadding, this.defaultPadding, 0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "SRAG - Síndrome respiratória aguda grave",
                          style: UITypography.title,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, this.defaultPadding, this.defaultPadding, 0),
                      child: Container(
                        width: 100,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.zoom_in,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: this.defaultPadding),
                        height: 56,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                this.indicadorPrincipal,
                                style: UITypography.indicadorPrincipalStyle
                                    .merge(TextStyle(
                                  color: this.color,
                                )),
                              )),
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 48,
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
                height: this.defaultPadding,
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
