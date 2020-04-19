import 'package:covidmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

class UIHelper {
  static String fomartDateDMY(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String fomartDateDM(DateTime date) {
    return "${date.day}/${date.month}";
  }

  static Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget headline(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
