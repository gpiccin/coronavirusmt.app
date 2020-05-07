import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_base.dart';
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
    return CardIndicadorBase(
      color: color,
      title: Text(
        this.title,
        style: UITypography.title,
      ),
      leftArea: Container(
          height: 40,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  this.leftIndicator,
                  style: UITypography.indicadorPrincipalStyle.merge(TextStyle(
                    color: this.color,
                  )),
                )),
          )),
      rightArea: Container(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 7.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Visibility(
              visible: this.rightIndicator != null,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  this.rightIndicator ?? "",
                  style: UITypography.indicadorSecundarioStyle
                      .merge(TextStyle(color: this.color)),
                ),
              ),
            ),
          ),
        ),
      ),
      firstBottomLine: (this.caption != null)
          ? Text(
              this.caption,
              softWrap: true,
            )
          : null,
      page: page,
    );
  }
}
