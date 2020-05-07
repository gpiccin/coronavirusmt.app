import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:coronavirusmt/ui/widgets/card_indicador_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class CardIndicador extends StatelessWidget {
  CardIndicador(
      {this.title,
      this.leftIndicator,
      this.newCases,
      this.percentCases,
      this.caption,
      this.color = Colors.black,
      this.page,
      this.graphData});

  final String title;
  final String caption;
  final String leftIndicator;
  final int newCases;
  final double percentCases;
  final Color color;
  final Widget page;
  final List<double> graphData;

  @override
  Widget build(BuildContext context) {
    Widget _caption() {
      return (this.caption != null)
          ? Text(
              this.caption,
              softWrap: true,
            )
          : null;
    }

    Widget _numbers() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: this.percentCases != null,
            child: Row(
              children: <Widget>[
                FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      UIHelper.formatPercent(percentCases) ?? "",
                      style: UITypography.indicadorSecundarioStyle
                          .merge(TextStyle(color: this.color)),
                    )),
                SizedBox(
                  width: UIStyle.padding,
                )
              ],
            ),
          ),
          Visibility(
              visible: this.newCases != null && this.newCases != 0,
              child: Icon(
                (this.newCases > 0)
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: color,
                size: 18,
              )),
          Visibility(
            visible: this.newCases != null && this.newCases != 0,
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  (this.newCases > 0)
                      ? this.newCases.toString()
                      : (this.newCases * -1).toString(),
                  style: UITypography.indicadorSecundarioStyle
                      .merge(TextStyle(color: this.color)),
                )),
          ),
        ],
      );
    }

    return CardIndicadorBase(
      color: color,
      title: Text(this.title, style: UITypography.title),
      leftArea: Container(
          height: 40,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(this.leftIndicator,
                  style: UITypography.indicadorPrincipalStyle
                      .merge(TextStyle(color: this.color))),
            ),
          )),
      rightArea: Container(
        height: 32,
        child: Sparkline(
          data: graphData,
          lineColor: this.color,
        ),
      ),
      firstBottomLine: _numbers(),
      secondBottomLine: _caption(),
      page: page,
    );
  }
}
