import 'package:covidmt/pages/covid/casos_cofirmados.dart';
import 'package:covidmt/ui/card_style.dart';
import 'package:covidmt/ui/text_styles.dart';
import 'package:flutter/material.dart';

class CardIndicadorSimples extends StatelessWidget {
  CardIndicadorSimples(
      {this.title,
      this.indicadorPrincipal,
      this.indicadorSecundario,
      this.color = Colors.black});

  final String title;
  final String indicadorPrincipal;
  final String indicadorSecundario;
  final double defaultPadding = 12.0;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: cardElevation,
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () => {Navigator.push(context, CasosConfirmadosPage())},
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
                    this.title,
                    style: cardTituloStyle,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                        margin: EdgeInsets.only(left: this.defaultPadding),
                        height: 50,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            this.indicadorPrincipal,
                            style: TextStyle(
                              color: this.color,
                              height: 0.5,
                            ).merge(cardIndicadorPrincipalStyle),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: this.defaultPadding),
                          child: Visibility(
                            visible: this.indicadorSecundario != null,
                            child: Text(
                              this.indicadorSecundario ?? "",
                              style: TextStyle(color: this.color)
                                  .merge(cardIndicadorSecundarioStyle),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: this.defaultPadding,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
