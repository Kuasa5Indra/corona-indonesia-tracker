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
                      Text(nf.format(data.getTotalSpecimen()),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalSpecimen())})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PCR + TCM = ${nf.format(data.getTotalPCRSpecimen())}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalPCRSpecimen())})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Antigen = ${nf.format(data.getTotalAntigenSpecimen())}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalAntigenSpecimen())})',
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
                      Text(nf.format(data.getTotalPeopleTested()),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalPeopleTested())})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PCR + TCM = ${nf.format(data.getTotalPCRTested())}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalPCRTested())})',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Antigen = ${nf.format(data.getTotalAntigenTested())}',
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalAntigenTested())})',
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
                      Text(nf.format(data.getTotalFirstVaccine()),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalFirstVaccine())})',
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
                      Text(nf.format(data.getTotalSecondVaccine()),
                          style: TextStyle(color: Colors.white, fontSize: 15)
                      ),
                      Text('(+${nf.format(data.getAdditionalSecondVaccine())})',
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
