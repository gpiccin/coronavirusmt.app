import 'dart:async';

import 'package:covidmt/pages/home/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  loadind(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 2500));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    loadind(context);
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          child: Text(
            "Vamos vencer essa luta",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Russo One",
                color: Color(0xfff1E347C)),
          ),
          elevation: 1,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 500,
              //color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage('assets/images/covid.jpeg'))),
            ),
            Text(
              "COVID MT",
              style: TextStyle(
                  fontSize: 90,
                  fontFamily: "Russo One",
                  color: Color(0xfff1E347C)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Boletim informativo",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              "Dados oficiais Secretário de Saúde MT",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
