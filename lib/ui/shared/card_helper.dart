import 'package:flutter/material.dart';

class CardHelper {
// const cardBackgroundColor = Color(0xffF0F0F0);

// 757575
  static const Color iconColor = Color(0xff757575);
  static const Color color = Colors.white;
  static const double elevation = 0.3;
  static RoundedRectangleBorder shape = new RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );

  static Widget touchableCard(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200], width: 1.0),
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.grey[200],
              blurRadius: 4.0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  static Widget informationCard(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.grey[300],
              blurRadius: 4.0,
              offset: new Offset(0.0, 0.0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
