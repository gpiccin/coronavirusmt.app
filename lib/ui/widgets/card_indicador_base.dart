import 'package:coronavirusmt/ui/shared/card_helper.dart';
import 'package:coronavirusmt/ui/shared/ui_helpers.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

class CardIndicadorBase extends StatelessWidget {
  CardIndicadorBase(
      {this.title,
      this.leftArea,
      this.rightArea,
      this.firstBottomLine,
      this.secondBottomLine,
      this.color = Colors.black,
      this.page});

  final Text title;
  final Widget leftArea;
  final Widget rightArea;
  final Widget firstBottomLine;
  final Widget secondBottomLine;
  final Color color;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    Widget _firstBottomLine() {
      return (this.firstBottomLine != null)
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  UIStyle.padding, UIStyle.padding - 4, UIStyle.padding, 0),
              child: this.firstBottomLine)
          : Container();
    }

    Widget _secondBottomLine() {
      return (this.secondBottomLine != null)
          ? Padding(
              padding: EdgeInsets.fromLTRB(
                  UIStyle.padding, UIStyle.padding - 4, UIStyle.padding, 0),
              child: this.secondBottomLine)
          : Container();
    }

    Widget _leftArea() {
      return (this.leftArea != null)
          ? Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    UIStyle.padding, 0, UIStyle.padding - 6, 0),
                child: this.leftArea,
              ),
            )
          : Expanded(
              child: Container(),
            );
    }

    Widget _rightArea() {
      return (this.rightArea != null)
          ? Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    UIStyle.padding - 6, 0, UIStyle.padding, 0),
                child: this.rightArea,
              ),
            )
          : Expanded(
              child: Container(),
            );
    }

    Widget _title() {
      return Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: UIStyle.padding),
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
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    UIStyle.padding - 3, UIStyle.padding, UIStyle.padding, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: this.title,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return CardHelper.touchableCard(
      InkWell(
        onTap: () => {UIHelper.openPage(context, page)},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _title(),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: <Widget>[_leftArea(), _rightArea()],
                ),
              ),
              _firstBottomLine(),
              _secondBottomLine(),
              SizedBox(height: UIStyle.padding)
            ],
          ),
        ),
      ),
    );
  }
}
