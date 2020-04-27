import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
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
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return CardHelper.touchableCard(
      InkWell(
        onTap: () => {UIHelper.openPage(context, page)},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: UIStyle.defaultPadding),
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
                    height: 30,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(UIStyle.defaultPadding - 2,
                          UIStyle.defaultPadding, UIStyle.defaultPadding, 0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          this.title,
                          style: UITypography.title,
                        ),
                      ),
                    ),
                  ),
                  (this.page != null)
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                0,
                                UIStyle.defaultPadding,
                                UIStyle.defaultPadding,
                                0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.zoom_in,
                                size: 18,
                                color: CardHelper.iconColor,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: UIStyle.defaultPadding),
                        height: 56,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                this.principalIndicator,
                                style: UITypography.indicadorPrincipalStyle
                                    .merge(TextStyle(
                                  color: this.color,
                                )),
                              )),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 48,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: UIStyle.defaultPadding),
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
                height: UIStyle.defaultPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
