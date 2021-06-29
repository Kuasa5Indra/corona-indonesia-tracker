import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:coronaindonesiatracker/api/daily_update/daily_report.dart';
import 'package:coronaindonesiatracker/api/daily_update/fetch_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyReportPage extends StatefulWidget {
  DailyReportPage({Key? key}) : super(key: key);

  @override
  _DailyReportPageState createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  Future<ReportData>? futureData;
  int positiveCases = 0;

  @override
  void initState() {
    super.initState();
    futureData = fetchReportData();
    fetchDailyUpdate().then((data) {
      positiveCases = data.getUpdatePositiveCases();
    });
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
              ? DailyReportDetail(data: snapshot.data!, positiveCases: positiveCases)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class DailyReportDetail extends StatelessWidget {
  final ReportData data;
  final int positiveCases;
  final nf = NumberFormat("###,###", "id_ID");

  DailyReportDetail({Key? key, required this.data, required this.positiveCases}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color getProgressVaccinationColor(){
      var progress = data.getTotalSecondVaccine() / 181554465 * 100;
      if(progress <= 25){
        return Colors.red;
      } else if(progress > 25 && progress <= 50){
        return Colors.orange;
      } else if(progress > 50 && progress <= 75){
        return Colors.yellow;
      } else {
        return Colors.green;
      }
    }

    String getPositivityRateCategory(){
      var positivityRate = this.positiveCases / data.getAdditionalPeopleTested() * 100;
      if(positivityRate < 2){
        return "Insiden Rendah";
      } else if(positivityRate >= 2 && positivityRate < 5){
        return "Insiden Sedang";
      } else if(positivityRate >= 5 && positivityRate < 20){
        return "Insiden Tinggi";
      } else {
        return "Insiden Sangat Tinggi";
      }
    }
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
          Card(
            color: Colors.grey,
            child: ListTile(
              title: Center(
                child: Text('Positivity Rate Harian',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Column(
                    children: [
                      Text(
                          (positiveCases / data.getAdditionalPeopleTested() * 100).toStringAsFixed(2) + '%',
                          style: TextStyle(color: Colors.white, fontSize: 24)
                      ),
                      Text(
                          getPositivityRateCategory(),
                          style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Positivity Rate dihitung berdasarkan jumlah orang '
                                'yang positif dibagi dengan jumlah orang yang dites ',
                            style: TextStyle(color: Colors.white, fontSize: 16)
                        ),
                      ),
                    ],
                  )
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Progress Vaksinasi'),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 20,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 3000,
                  percent: data.getTotalSecondVaccine() / 181554465,
                  center: Text((data.getTotalSecondVaccine() / 181554465 * 100).toStringAsFixed(2) + '%'),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: getProgressVaccinationColor(),
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
          Card(
            color: Colors.cyan,
            child: ListTile(
              title: Center(
                child: Text('Target Vaksinasi Nasional',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Text(nf.format(181554465),
                      style: TextStyle(color: Colors.white, fontSize: 24)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
