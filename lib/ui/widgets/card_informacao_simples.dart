import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class CardInformacaoSimples extends StatelessWidget {
  CardInformacaoSimples(
      {this.title,
      this.principalIndicator,
      this.indicatorLabel,
      this.color = Colors.black,
      this.page,
      this.caption,
      this.secondCaption});

  final String title;
  final String principalIndicator;
  final String indicatorLabel;
  final double defaultPadding = 12.0;
  final Color color;
  final Widget page;
  final String caption;
  final String secondCaption;

  @override
  Widget build(BuildContext context) {
    return CardHelper.informationCard(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
              this.defaultPadding, this.defaultPadding, this.defaultPadding, 0),
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
                        this.principalIndicator,
                        style: UITypography.indicadorPrincipalStyle
                            .merge(TextStyle(
                          color: this.color,
                          height: 0.5,
                        )),
                      )),
                )),
            Container(
              height: 48,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: this.defaultPadding),
                  child: Visibility(
                    visible: this.indicatorLabel != null,
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          this.indicatorLabel ?? "",
                          style: UITypography.indicadorSecundarioStyle
                              .merge(TextStyle(color: this.color)),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
        (this.caption != null || this.secondCaption != null)
            ? Padding(
                padding: EdgeInsets.fromLTRB(this.defaultPadding,
                    this.defaultPadding, this.defaultPadding, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (this.caption != null)
                        ? Text(
                            this.caption,
                            style: UITypography.caption,
                          )
                        : Container(),
                    (this.caption != null)
                        ? SizedBox(
                            height: 4,
                          )
                        : Container(),
                    (this.secondCaption != null)
                        ? Text(
                            this.secondCaption,
                            style: UITypography.caption,
                          )
                        : Container(),
                  ],
                ))
            : Container(),
        SizedBox(
          height: this.defaultPadding + 8,
        )
      ],
    ));
  }
}
