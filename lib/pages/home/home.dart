import 'package:covidmt/core/viewmodels/covid/indicadores_view_model.dart';
import 'package:covidmt/pages/base_view.dart';
import 'package:covidmt/pages/home/views/boletins.dart';
import 'package:covidmt/pages/home/views/indicadores.dart';
import 'package:covidmt/pages/home/widget/header.dart';
import 'package:covidmt/ui/ui_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 12.0;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    IndicadoresView(),
    BoletinsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<IndicadoresViewModel>(
        onModelReeady: (model) => model.getBoletim(),
        builder:
            (BuildContext context, IndicadoresViewModel model, Widget child) =>
                Scaffold(
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Header(),
                        _widgetOptions.elementAt(_selectedIndex)
                      ]),
                  bottomNavigationBar: BottomNavigationBar(
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.equalizer),
                        title: Text('Indicadores'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.library_books),
                        title: Text('Boletins'),
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: headerBackgroundColor,
                    onTap: _onItemTapped,
                  ),
                ));
  }
}
