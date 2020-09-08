import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/page/homepage.dart';
import 'package:coronaindonesiatracker/page/info_cases_page.dart';
import 'package:coronaindonesiatracker/page/place_page.dart';

void main() => runApp(CoronaTrackerApp());

class CoronaTrackerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Indonesia Tracker',
      home: AppNavigationBar()
    );
  }
}

class AppNavigationBar extends StatefulWidget {
  @override
  _AppNavigationBarState createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  final _pages = [
    HomePage(),
    InfoCasesPage(),
    PlacesPage()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.redAccent,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              title: Text('Cases'),
              icon: Icon(Icons.info_outline)
          ),
          BottomNavigationBarItem(
              title: Text('Places'),
              icon: Icon(Icons.location_city)
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}








