import 'package:coronaindonesiatracker/page/map_places/distribution_map_page.dart';
import 'package:flutter/material.dart';

import 'map_places/risk_map_page.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Places'),
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Lokasi Sebaran'),
              Tab(text: 'Lokasi Resiko'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DistributionMapPage(),
            RiskMapPage(),
          ],
        ),
      ),
    );
  }
}
