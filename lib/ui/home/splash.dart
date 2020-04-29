import 'package:coronavirusmt/ui/home/home.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return _splashScreen();
  }
}

Widget _splashScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.transparent,
      ),
      Scaffold(
          backgroundColor: UIStyle.appBackgroundColor,
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Dados oficiais da Secretário de Saúde de MT",
                textAlign: TextAlign.center,
                style: UITypography.title,
              ),
            ),
            elevation: 1,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 150,
                width: 300,
                //color: Colors.red,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: new AssetImage('assets/images/virus.png'))),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "CORONAVÍRUS EM MT",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UIStyle.headerBackgroundColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1),
              ),
              Text(
                "Vamos vencer esta luta!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UIStyle.headerBackgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1),
              ),
            ],
          ))
    ],
  );
}
