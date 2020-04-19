import 'package:flutter/material.dart';

class UIHelper {
  static String fomartDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
