import 'package:covidmt/pages/splash.dart';
import 'package:flutter/material.dart';

main() async {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid MT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage()));
}
