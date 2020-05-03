import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class CardIndicadorSimples extends StatelessWidget {
  CardIndicadorSimples(
      {this.title,
      this.leftIndicator,
      this.rightIndicator,
      this.caption,
      this.color = Colors.black,
      this.page});

  final String title;
  final String caption;
  final String leftIndicator;
  final String rightIndicator;
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
                    padding: EdgeInsets.only(top: UIStyle.padding),
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
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(UIStyle.padding - 2,
                            UIStyle.padding, UIStyle.padding, 0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            this.title,
                            style: UITypography.title,
                          ),
                        ),
                      ),
                    ),
                  ),
                  (this.page != null)
                      ? Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, UIStyle.padding, UIStyle.padding, 0),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.zoom_in,
                                size: 18,
                                color: UIStyle.iconColor,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Container(),
                        ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: UIStyle.padding),
                        height: 52,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                this.leftIndicator,
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
                      height: 44,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: UIStyle.padding),
                          child: Visibility(
                            visible: this.rightIndicator != null,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  this.rightIndicator ?? "",
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
              (this.caption != null)
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(
                          UIStyle.padding, UIStyle.padding, UIStyle.padding, 0),
                      child: Text(
                        this.caption,
                        softWrap: true,
                      ))
                  : Container(),
              SizedBox(
                height: UIStyle.padding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
