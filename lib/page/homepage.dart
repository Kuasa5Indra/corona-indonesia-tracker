import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/page/homepage/daily_report_page.dart';
import 'package:coronaindonesiatracker/page/homepage/daily_update_page.dart';
// import 'package:intl/intl.dart';
// import 'package:coronaindonesiatracker/api/daily_update/daily_update.dart';
// import 'package:coronaindonesiatracker/api/daily_update/fetch_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<DailyData>? futureData;
  //
  // @override
  // void initState() {
  //   futureData = fetchDailyUpdate();
  //   super.initState();
  // }

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
            DailyReportPage(),
          ],
        ),
      ),
    );
  }
}

// class DailyUpdateDetail extends StatelessWidget {
//   final DailyData data;
//   final nf = NumberFormat("###,###", "id_ID");
//
//   DailyUpdateDetail({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Image.asset('assets/ilustrasi-peta-sebaran-small.jpg'),
//           Align(
//             alignment: Alignment.center,
//             heightFactor: 2.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('Update Harian'),
//                 Text(DateFormat.yMMMMd().format(DateTime.parse(data.getUpdateDate())))
//               ],
//             ),
//           ),
//           Card(
//             color: Colors.red,
//             child: ListTile(
//               title: Center(
//                 child: Text('${nf.format(int.parse(data.getUpdateTotalPositiveCases()))}',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                           'Terkonfirmasi',
//                           style: TextStyle(color: Colors.white, fontSize: 24)
//                       ),
//                       Text(
//                           '${nf.format(int.parse(data.getUpdatePositiveCases()))} kasus',
//                           style: TextStyle(color: Colors.white, fontSize: 16)
//                       ),
//                     ],
//                   )
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.orange,
//             child: ListTile(
//               title: Center(
//                 child: Text('${nf.format(int.parse(data.getUpdateTotalTreatedCases()))}',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                           'Kasus Aktif',
//                           style: TextStyle(color: Colors.white, fontSize: 24)
//                       ),
//                       Text(
//                           '${nf.format(int.parse(data.getUpdateTreatedCases()))} kasus',
//                           style: TextStyle(color: Colors.white, fontSize: 16)
//                       ),
//                     ],
//                   )
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.green,
//             child: ListTile(
//               title: Center(
//                 child: Text('${nf.format(int.parse(data.getUpdateTotalCuredCases()))}',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                           'Sembuh',
//                           style: TextStyle(color: Colors.white, fontSize: 24)
//                       ),
//                       Text(
//                           '${nf.format(int.parse(data.getUpdateCuredCases()))} kasus',
//                           style: TextStyle(color: Colors.white, fontSize: 16)
//                       ),
//                     ],
//                   )
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.blue,
//             child: ListTile(
//               title: Center(
//                 child: Text('${nf.format(int.parse(data.getUpdateTotalDeathCases()))}',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Column(
//                     children: [
//                       Text(
//                           'Meninggal',
//                           style: TextStyle(color: Colors.white, fontSize: 24)
//                       ),
//                       Text(
//                           '${nf.format(int.parse(data.getUpdateDeathCases()))} kasus',
//                           style: TextStyle(color: Colors.white, fontSize: 16)
//                       ),
//                     ],
//                   )
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.black,
//             child: ListTile(
//               title: Center(
//                 child: Text('${nf.format(int.parse(data.getSuspect()))}',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Text(
//                       'Suspek',
//                       style: TextStyle(color: Colors.white, fontSize: 24)
//                   )
//               ),
//             ),
//           ),
//           Divider(
//             height: 40,
//             thickness: 3,
//             indent: 10,
//             endIndent: 10,
//           ),
//           Align(
//             alignment: Alignment.center,
//             heightFactor: 2.0,
//             child: Text('Data Spesimen', style: TextStyle(fontSize: 18)),
//           ),
//           Card(
//             color: Colors.grey,
//             child: ListTile(
//               title: Center(
//                 child: Text('Total Spesimen',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Text('${nf.format(int.parse(data.getSpecimens()))}',
//                       style: TextStyle(color: Colors.white, fontSize: 24)
//                   )
//               ),
//             ),
//           ),
//           Card(
//             color: Colors.grey,
//             child: ListTile(
//               title: Center(
//                 child: Text('Spesimen Negatif',
//                     style: TextStyle(color: Colors.white, fontSize: 18)
//                 ),
//               ),
//               subtitle: Center(
//                   child: Text('${nf.format(int.parse(data.getNegativeSpecimens()))}',
//                       style: TextStyle(color: Colors.white, fontSize: 24)
//                   )
//               ),
//             ),
//           ),
//           Align(
//               alignment: Alignment.center,
//               heightFactor: 3.0,
//               child: Text('Satuan Tugas Penanganan Covid-19 di Indonesia')
//           ),
//         ],
//       ),
//     );
//   }
// }

