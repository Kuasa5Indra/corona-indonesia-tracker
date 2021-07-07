import 'package:coronaindonesiatracker/cubit/distribution_place/distribution_place_view.dart';
import 'package:coronaindonesiatracker/cubit/risk_place/risk_place_view.dart';
import 'package:flutter/material.dart';

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
          title: Text('Lokasi'),
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
            DistributionPlacePage(),
            RiskPlacePage(),
          ],
        ),
      ),
    );
  }
}
