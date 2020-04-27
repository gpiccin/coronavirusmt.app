import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/ui/home/splash.dart';
import 'package:flutter/material.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavírus em MT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenPage());
  }
}
