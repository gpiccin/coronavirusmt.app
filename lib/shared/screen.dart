import 'package:flutter/cupertino.dart';

class Screen {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeigh(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
