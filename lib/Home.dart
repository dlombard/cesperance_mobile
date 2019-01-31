import 'package:flutter/material.dart';
import 'Booklist.dart';
import 'Favorites.dart';
import 'Search.dart';
import 'Help.dart';
import 'BaseContainer.dart';
import 'App_localizations.dart';

class Home extends StatefulWidget {
  //Home({Key key}) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<Home> {
  int _selectedIndex = 1;
  Widget _currentTitle;
  String search;
  String home;
  String favorites;
  List<Map<String, Object>> widgets;
  List<String> popupOptions;

  @override
  Widget build(BuildContext context) {
    popupOptions = [AppLocalizations.of(context).help];
    search = AppLocalizations.of(context).search;
    home = AppLocalizations.of(context).home;
    favorites = AppLocalizations.of(context).favorites;
    _currentTitle = Text("Chant d'Espérance", style: TextStyle(color: Colors.white));
    widgets = [
      {"title": search, "child": Search()},
      {"title": home, "child": Booklist()},
      {"title": favorites, "child": Favorites()}
    ];
    return BaseContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: _currentTitle,
              elevation: 4.0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                PopupMenuButton<String>(
                  onSelected: _selectedPopUp,
                  itemBuilder: (BuildContext context) {
                    return popupOptions.map((String choice) {
                      return PopupMenuItem<String>(
                          value: choice, child: Text(choice));
                    }).toList();
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), title: Text(search)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text(home)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.stars), title: Text(favorites)),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body: Center(

              child: widgets.elementAt(_selectedIndex)["child"],
            )));
  }

  void _selectedPopUp(String choice) {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      return Help();
    }));
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentTitle = Text(widgets.elementAt(index)["title"], style: TextStyle(color: Colors.white));
      _selectedIndex = index;
    });
  }
}
