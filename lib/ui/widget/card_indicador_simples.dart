import 'package:covidmt/ui/base/card_style.dart';
import 'package:covidmt/ui/base/ui_typography.dart';
import 'package:flutter/material.dart';

class CardIndicadorSimples extends StatelessWidget {
  CardIndicadorSimples(
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
        child: Card(
      elevation: cardElevation,
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () => {this.openPage(context)},
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
                              color: this.color,
                              height: 0.5,
                            )),
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
                              style: UITypography.indicadorSecundarioStyle
                                  .merge(TextStyle(color: this.color)),
                            ),
                          ),
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
        ),
      ),
    ));
  }
}
