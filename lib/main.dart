import 'package:covidmt/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid MT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage()));
}
