import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UIHelper {
  static String fomartDateDMY(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String fomartDateDM(DateTime date) {
    return "${date.day}/${date.month}";
  }

  static Widget loading() {
    return Center(
        child: SpinKitPulse(
      color: UIStyle.headerBackgroundColor,
      size: 50.0,
    ));
  }

  static openPage(BuildContext context, Widget page) {
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      return;
    }

    UIHelper.showSnackBar(context, Text("Sem detalhes até o momento."));
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
      padding: padding ?? const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        title,
        style: UITypography.headline,
      ),
    );
  }

  static AppBar pageAppBar(String title) {
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
