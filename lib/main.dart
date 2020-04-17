import 'package:covidmt/pages/splash.dart';
import 'package:covidmt/pages/sras/srars_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(AppWidget());
  });
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Srars_controller>(
          create: (_) => Srars_controller(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid MT',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreenPage()),
    );
  }
}
