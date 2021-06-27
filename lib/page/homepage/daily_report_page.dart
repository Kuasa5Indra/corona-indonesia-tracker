import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:coronaindonesiatracker/api/daily_update/daily_report.dart';
import 'package:coronaindonesiatracker/api/daily_update/fetch_data.dart';

class DailyReportPage extends StatefulWidget {
  DailyReportPage({Key? key}) : super(key: key);

  @override
  _DailyReportPageState createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  Future<ReportData>? futureData;

  @override
  void initState() {
    futureData = fetchReportData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<ReportData>(
        future: futureData,
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }
          return (snapshot.hasData)
              ? DailyReportDetail(data: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DailyReportDetail extends StatelessWidget {
  final ReportData data;
  final nf = NumberFormat("###,###", "id_ID");

  DailyReportDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/covid-test.jpg'),
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Column(
              children: [
                Text('Update Data Pemeriksaan Covid-19',
                    style: TextStyle(
                        fontSize: 20
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Update Terbaru'),
                    Text(DateFormat.yMMMMd().format(DateTime.parse(data.getUpdateTestingDate())))
                  ],
                ),
              ],
            ),
          ),
          Card(
            color: Colors.grey,
            child: ListTile(
              title: Center(
                child: Text('Total Spesimen Diperiksa',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nf.format(int.parse(data.getTotalSpecimen())),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalSpecimen()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PCR + TCM = ${nf.format(int.parse(data.getTotalPCRSpecimen()))}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalPCRSpecimen()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Antigen = ${nf.format(int.parse(data.getTotalAntigenSpecimen()))}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalAntigenSpecimen()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.grey,
            child: ListTile(
              title: Center(
                child: Text('Total Orang Diperiksa',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nf.format(int.parse(data.getTotalPeopleTested())),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalPeopleTested()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PCR + TCM = ${nf.format(int.parse(data.getTotalPCRTested()))}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalPCRTested()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Antigen = ${nf.format(int.parse(data.getTotalAntigenTested()))}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalAntigenTested()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 40,
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),
          Image.asset('assets/covid-vaccine.jpg'),
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Column(
              children: [
                Text('Update Data Vaksinasi Covid-19',
                    style: TextStyle(
                        fontSize: 20
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Update Terbaru'),
                    Text(DateFormat.yMMMMd().format(DateTime.parse(data.getUpdateVaccinationDate())))
                  ],
                ),
              ],
            ),
          ),
          Card(
            color: Colors.cyan,
            child: ListTile(
              title: Center(
                child: Text('Vaksinasi Pertama',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nf.format(int.parse(data.getTotalFirstVaccine())),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalFirstVaccine()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.cyan,
            child: ListTile(
              title: Center(
                child: Text('Vaksinasi Kedua',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(nf.format(int.parse(data.getTotalSecondVaccine())),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(int.parse(data.getAdditionalSecondVaccine()))})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
