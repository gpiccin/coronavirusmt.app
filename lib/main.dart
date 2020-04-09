import 'package:covidmt/pages/home/home.dart';
import 'package:covidmt/splash.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid MT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash()));
}
