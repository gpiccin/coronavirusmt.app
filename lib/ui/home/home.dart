import 'package:coronavirusmt/ui/covid/views/boletins.dart';
import 'package:coronavirusmt/ui/home/views/situacao_atual.dart';
import 'package:coronavirusmt/ui/home/widgets/header.dart';
import 'package:coronavirusmt/ui/noticias/noticias.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:coronavirusmt/ui/shared/ui_typography.dart';
import 'package:flutter/material.dart';

// Somewhere in your widgets...

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SituacaoAtualView(),
    NoticiasView(),
    BoletinsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _navigationBarItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          text,
          style: UITypography.caption
              .merge(TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIStyle.appBackgroundColor,
      body: Column(children: <Widget>[
        Header(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                UIStyle.padding, 0, UIStyle.padding, UIStyle.padding),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          this._navigationBarItem(Icons.show_chart, "Situação atual"),
          this._navigationBarItem(Icons.public, "Notícias"),
          this._navigationBarItem(Icons.library_books, "Boletins"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: UIStyle.casosColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
