import 'package:covidmt/pages/splash.dart';
import 'package:covidmt/shared/repository/Repositorie.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await AppRepositoriy.getDadosBoletim();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid MT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage()));
}
