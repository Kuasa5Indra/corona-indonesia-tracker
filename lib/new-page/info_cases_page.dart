import 'package:coronaindonesiatracker/cubit/info_cases/info_cases_cubit.dart';
import 'package:coronaindonesiatracker/cubit/info_cases/info_cases_state.dart';
import 'package:coronaindonesiatracker/data/model/info_cases.dart';
import 'package:flutter/material.dart';
// import 'package:coronaindonesiatracker/api/info_cases/fetch_info_cases.dart';
// import 'package:coronaindonesiatracker/api/info_cases/info_cases.dart';
import 'package:coronaindonesiatracker/new-page/category_cases/category_cases_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoCasesScreen extends StatefulWidget {
  @override
  _InfoCasesScreenState createState() => _InfoCasesScreenState();
}

class _InfoCasesScreenState extends State<InfoCasesScreen> {
  // Future<InfoCases>? futureInfoCases;
  //
  // @override
  // void initState() {
  //   futureInfoCases = fetchInfoCases();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Konfirmasi',
      'Aktif',
      'Sembuh',
      'Meninggal',
    ];
    BlocProvider.of<InfoCasesCubit>(context).getInfoCases();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Info Kasus'),
            backgroundColor: Colors.redAccent,
            bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: [
                for (final tab in tabs) Tab(text: tab),
              ],
            ),
          ),
          body: BlocBuilder<InfoCasesCubit, InfoCasesState>(
            builder: (context, state) {
              if(state is InfoCasesLoading){
                return Center(child: CircularProgressIndicator());
              } else if(state is InfoCasesLoaded){
                return InfoCasesDetail(infoCases: (state).infoCases);
              } else {
                return Center(child: Text((state as InfoCasesError).message));
              }
            },
          )
      ),
    );
  }
}

class InfoCasesDetail extends StatelessWidget {
  final InfoCases infoCases;

  InfoCasesDetail({Key? key, required this.infoCases}) : super(key: key);

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

