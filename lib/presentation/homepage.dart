import 'package:coronaindonesiatracker/cubit/daily_report/daily_report_view.dart';
import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/cubit/daily_update/daily_update_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beranda'),
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Update Harian'),
              Tab(text: 'Update Laporan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DailyUpdatePage(),
            DailyReportPage()
          ],
        ),
      ),
    );
  }
}

