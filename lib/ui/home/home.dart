import 'package:coronavirusmt/ui/covid/views/boletins.dart';
import 'package:coronavirusmt/ui/home/views/situacao_atual.dart';
import 'package:coronavirusmt/ui/home/widgets/header.dart';
import 'package:coronavirusmt/ui/noticias/noticias.dart';
import 'package:coronavirusmt/ui/shared/ui_style.dart';
import 'package:flutter/material.dart';

// Somewhere in your widgets...

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> _widgetOptions = <Widget>[
    SituacaoAtualView(),
    NoticiasView(),
    BoletinsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 250), curve: Curves.decelerate);
    });
  }

  BottomNavigationBarItem _navigationBarItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 20,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(text),
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
                  UIStyle.padding, 0, UIStyle.padding, 0),
              child: PageView(
                controller: _pageController,
                children: _widgetOptions,
              ),
            ),
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            this._navigationBarItem(Icons.show_chart, "Situação atual"),
            this._navigationBarItem(Icons.public, "Notícias"),
            this._navigationBarItem(Icons.library_books, "Boletins"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: UIStyle.casosColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: TextStyle(color: UIStyle.casosColor),
          onTap: _onItemTapped,
        ));
  }
}
