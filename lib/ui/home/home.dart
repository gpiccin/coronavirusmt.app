import 'package:coronavirusmt/ui/covid/views/boletins.dart';
import 'package:coronavirusmt/ui/home/views/situacao_atual.dart';
import 'package:coronavirusmt/ui/home/widgets/header.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

// Somewhere in your widgets...

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double defaultPadding = 12.0;

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SituacaoAtualView(),
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
      backgroundColor: UIStyle.appBackgroundColor,
      body: Column(children: <Widget>[
        Header(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(UIStyle.defaultPadding, 0,
                UIStyle.defaultPadding, UIStyle.defaultPadding),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text('Situação atual'),
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
