import 'package:covidmt/ui/shared/card_style.dart';
import 'package:covidmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class CardInformacaoSimples extends StatelessWidget {
  CardInformacaoSimples(
      {this.title,
      this.indicadorPrincipal,
      this.indicadorSecundario,
      this.color = Colors.black,
      this.page});

  final String title;
  final String indicadorPrincipal;
  final String indicadorSecundario;
  final double defaultPadding = 12.0;
  final Color color;
  final Widget page;

  openPage(BuildContext context) {
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: cardBackgroundColor,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(this.defaultPadding,
                    this.defaultPadding, this.defaultPadding, 0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    this.title,
                    style: UITypography.title,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
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
                                color: this.color,
                                height: 0.5,
                              )),
                            )),
                      )),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: this.defaultPadding),
                        child: Visibility(
                          visible: this.indicadorSecundario != null,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                this.indicadorSecundario ?? "",
                                style: UITypography.indicadorSecundarioStyle
                                    .merge(TextStyle(color: this.color)),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: this.defaultPadding + 8,
              )
            ],
          ),
        ));
  }
}
