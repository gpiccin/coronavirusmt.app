import 'package:flutter/material.dart';

class CardHelper {
  static const Color color = Colors.white;
  static const double elevation = 0.3;
  static RoundedRectangleBorder shape = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.grey[200], width: 1.0),
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      // boxShadow: <BoxShadow>[
      //   new BoxShadow(
      //     color: Colors.grey[200],
      //     blurRadius: 1.0,
      //     offset: new Offset(0.5, 0.5),
      //   ),
      // ],
    );
  }

  static Widget touchableCard(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: boxDecoration(),
        child: child,
      ),
    );
  }
}
