import 'package:covidmt/core/locator.dart';
import 'package:covidmt/ui/home/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    setupLocator();
    runApp(AppWidget());
  });
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid MT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenPage());
  }
}
