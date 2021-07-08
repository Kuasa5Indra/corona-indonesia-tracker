import 'package:coronaindonesiatracker/cubit/info_cases/info_cases_view.dart';
import 'package:coronaindonesiatracker/presentation/no_connection.dart';
import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/presentation/homepage.dart';
import 'package:coronaindonesiatracker/presentation/place_page.dart';
import 'package:cross_connectivity/cross_connectivity.dart';

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
              label: 'Beranda',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'Info Kasus',
              icon: Icon(Icons.info_outline)
          ),
          BottomNavigationBarItem(
              label: 'Lokasi',
              icon: Icon(Icons.location_city)
          ),
        ],
      ),
      body: ConnectivityBuilder(
        builder: (context, isConnected, status) {
          if(status != ConnectivityStatus.none){
            return _pages[_currentIndex];
          } else {
            return NoConnectionPage();
          }
        },
      ),
    );
  }
}








