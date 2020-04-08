import 'package:covidmt/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {
    1: HomePage(),
  };

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Covid MT',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AnimatedSplash(
      imagePath: 'assets/images/covid.jpeg',
      home: HomePage(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));
}
