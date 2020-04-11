import 'package:covidmt/pages/home/home.dart';
import 'package:covidmt/ui/text_styles.dart';
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
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
            child: Text(
              "Vamos vencer essa luta",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Russo One",
                  color: Color(0xfff1E347C)),
            ),
            elevation: 1,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 500,
                //color: Colors.red,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: new AssetImage('assets/images/covid.jpeg'))),
              ),
              Text(
                "COVID MT",
                style: tituloSplashStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Boletim informativo",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Dados oficiais Secretário de Saúde MT",
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ))
    ],
  );
}
