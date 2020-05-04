import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIHelper {
  static String fomartDateDMY(DateTime date) {
    if (date == null) return "";
    return "${date.day}/${date.month}/${date.year}";
  }

  static String fomartDateDM(DateTime date) {
    if (date == null) return "";
    return "${date.day}/${date.month}";
  }

  static Widget divider({double paddingLeft, double paddingRight}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(paddingLeft ?? UIStyle.padding + 4, 0,
          paddingRight ?? UIStyle.padding + 4, 0),
      child: Divider(),
    );
  }

  static String formatPercent(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1) +
        "%";
  }

  static String formatDifference(int value) {
    if (value > 0) return "+ " + value.toString();

    if (value < 0) return "- " + value.toString();

    return "0";
  }

  static Widget loading() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
      child: Center(
          child: SpinKitRipple(
        color: UIStyle.loadingColor,
        size: 50.0,
      )),
    );
  }

  static openPage(BuildContext context, Widget page) {
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      return;
    }
  }

  static showSnackBar(BuildContext context, Widget content,
      {SnackBarBehavior behavior = SnackBarBehavior.fixed}) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: content,
      behavior: behavior,
    ));
  }

  static Widget headline(String title, {EdgeInsets padding}) {
    return Padding(
      padding: padding ??
          const EdgeInsets.fromLTRB(0, UIStyle.padding, 0, UIStyle.padding),
      child: Text(
        title,
        style: UITypography.headline,
      ),
    );
  }

  static AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }
}
