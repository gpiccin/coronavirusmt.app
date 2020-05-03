import 'package:coronavirusmt/core/locator.dart';
import 'package:coronavirusmt/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await Hive.initFlutter();

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
        home: SafeArea(top: true, bottom: true, child: HomePage()));
  }
}
