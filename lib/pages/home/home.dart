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
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(),
            _widgetOptions.elementAt(_selectedIndex)
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Cenário atual'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Boletins'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: UIStyle.headerBackgroundColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
