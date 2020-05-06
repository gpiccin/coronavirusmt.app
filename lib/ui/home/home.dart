import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: UIStyle.appBackgroundColor,

          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.show_chart),
              title: Text('Situação', textAlign: TextAlign.center),
              activeColor: UIStyle.casosColor,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.public),
                title: Text('Notícias', textAlign: TextAlign.center),
                activeColor: UIStyle.casosColor),
            BottomNavyBarItem(
                icon: Icon(Icons.library_books),
                title: Text('Boletins', textAlign: TextAlign.center),
                activeColor: UIStyle.casosColor),
          ],
        ));
  }
}
