import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/api/info_cases/fetch_info_cases.dart';
import 'package:coronaindonesiatracker/api/info_cases/info_cases.dart';
import 'package:coronaindonesiatracker/page/category_cases/category_cases_page.dart';

class InfoCasesPage extends StatefulWidget {
  @override
  _InfoCasesPageState createState() => _InfoCasesPageState();
}

class _InfoCasesPageState extends State<InfoCasesPage> {
  Future<InfoCases> futureInfoCases;

  @override
  void initState() {
    futureInfoCases = fetchInfoCases();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Confirm',
      'Treated',
      'Cured',
      'Death',
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Info Cases'),
          backgroundColor: Colors.redAccent,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              for (final tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: FutureBuilder<InfoCases>(
          future: futureInfoCases,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error));
            }
            return (snapshot.hasData)
                ? InfoCasesDetail(infoCases: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class InfoCasesDetail extends StatelessWidget {
  final InfoCases infoCases;

  InfoCasesDetail({Key key, this.infoCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CategoryCasesPage(
          info: infoCases.infoConfirmed, date: infoCases.lastUpdate
        ),
        CategoryCasesPage(
          info: infoCases.infoTreated, date: infoCases.lastUpdate,
        ),
        CategoryCasesPage(
          info: infoCases.infoCured, date: infoCases.lastUpdate,
        ),
        CategoryCasesPage(
          info: infoCases.infoDeath, date: infoCases.lastUpdate,
        )
      ],
    );
  }
}

