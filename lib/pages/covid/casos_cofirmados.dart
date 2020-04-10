import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';

class CasosConfirmadosPage extends MaterialPageRoute<Null> {
  CasosConfirmadosPage()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: headerBackgroundColor,
              elevation: 0,
              title: Text(
                "Casos confirmados",
              ),
            ),
            body: Builder(
              builder: (BuildContext context) => Center(
                child: RaisedButton(
                  child: Text('Go to page 3'),
                  onPressed: () {},
                ),
              ),
            ),
          );
        });
}
