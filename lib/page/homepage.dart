import 'package:flutter/material.dart';
import 'package:coronaindonesiatracker/api/daily_update/daily_update.dart';
import 'package:coronaindonesiatracker/api/daily_update/fetch_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<DailyData> futureData;

  @override
  void initState() {
    futureData = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona Indonesia Tracker'),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: FutureBuilder<DailyData>(
          future: futureData,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error));
            }
            return (snapshot.hasData)
                ? DailyUpdateDetail(data: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class DailyUpdateDetail extends StatelessWidget {
  final DailyData data;

  DailyUpdateDetail({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/ilustrasi-peta-sebaran-small.jpg'),
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Update'),
                Text(data.getUpdateDate())
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Table(
                children: [
                  TableRow(children: [
                    Center(child: Text('Terkonfirmasi')),
                    Center(child: Text(
                        '${data.getUpdateTotalPositiveCases()} ('
                            '${data.getUpdatePositiveCases()})',
                    style: TextStyle(
                      color: Colors.red
                    )))
                  ]),
                  TableRow(children: [
                    Center(child: Text('Perawatan')),
                    Center(child: Text(
                        '${data.getUpdateTotalTreatedCases()} ('
                            '${data.getUpdateTreatedCases()})',
                    style: TextStyle(
                      color: Colors.orange
                    )))
                  ]),
                  TableRow(children: [
                    Center(child: Text('Sembuh')),
                    Center(child: Text('${data.getUpdateTotalCuredCases()} ('
                        '${data.getUpdateCuredCases()})',
                    style: TextStyle(
                      color: Colors.green
                    )))
                  ]),
                  TableRow(children: [
                    Center(child: Text('Meninggal')),
                    Center(child: Text('${data.getUpdateTotalDeathCases()} ('
                        '${data.getUpdateDeathCases()})',
                    style: TextStyle(
                      color: Colors.blue
                    )))
                  ]),
                  TableRow(children: [
                    Center(child: Text('Suspek')),
                    Center(child: Text(data.getSuspect()))
                  ]),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Text('Spesimen hari ini', style: TextStyle(
             fontSize: 40.0
            )),
          ),
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Text('${data.getSpecimens()} (${data.getNegativeSpecimens()} Negatif)',
                style: TextStyle(
                fontSize: 20.0
            )),
          ),
          Align(
            alignment: Alignment.center,
            heightFactor: 3.0,
            child: Text('Satuan Tugas Penanganan Covid-19 di Indonesia')
          ),
        ],
      ),
    );
  }
}

