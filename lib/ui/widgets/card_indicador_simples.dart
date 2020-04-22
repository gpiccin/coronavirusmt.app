import 'package:coronavirusmt/ui/shared/card_style.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class CardIndicadorSimples extends StatelessWidget {
  CardIndicadorSimples(
      {this.title,
      this.principalIndicator,
      this.secondIndicator,
      this.color = Colors.black,
      this.page});

  final String title;
  final String principalIndicator;
  final String secondIndicator;
  final double defaultPadding = 12.0;
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation,
      color: cardBackgroundColor,
      child: InkWell(
        onTap: () => {UIHelper.openPage(context, page)},
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
                                this.principalIndicator,
                                style: UITypography.indicadorPrincipalStyle
                                    .merge(TextStyle(
                                  color: this.color,
                                  height: 0.5,
                                )),
                              )),
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
                            visible: this.secondIndicator != null,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  this.secondIndicator ?? "",
                                  style: UITypography.indicadorSecundarioStyle
                                      .merge(TextStyle(color: this.color)),
                                )),
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
    );
  }
}
