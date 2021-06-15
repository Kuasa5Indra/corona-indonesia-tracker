import 'package:coronaindonesiatracker/api/place/fetch_risk_map.dart';
import 'package:coronaindonesiatracker/api/place/risk_map.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class RiskMapPage extends StatefulWidget {
  @override
  _RiskMapPageState createState() => _RiskMapPageState();
}

class _RiskMapPageState extends State<RiskMapPage> {
  String date;
  List<InfoCity> infoCities;
  List<InfoCity> filterInfoCities;
  bool isLoading = true;

  @override
  void initState() {
    fetchRiskMap().then((data){
      date = data.date;
      infoCities = data.infoCities;
      filterInfoCities = infoCities;
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Color getStatusColor(int index){
    switch(filterInfoCities[index].risk){
      case 'RESIKO TINGGI':
        return Colors.red;
      case 'RESIKO SEDANG':
        return Colors.orange;
      case 'RESIKO RENDAH':
        return Colors.yellow;
      case 'TIDAK ADA KASUS':
        return Colors.lightGreen;
      case 'TIDAK TERDAMPAK':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  Widget riskMapDetail(){
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter city, province or risk status',
                border: InputBorder.none
              ),
              onChanged: (value) {
                setState(() {
                  filterInfoCities = infoCities.where((data) =>
                  data.city.toLowerCase().contains(value.toLowerCase()) ||
                      data.province.toLowerCase().contains(value.toLowerCase()) ||
                      data.risk.toLowerCase().contains(value.toLowerCase())
                  ).toList();
                });
              },
            ),
          ),
          Expanded(
            child: (filterInfoCities.isNotEmpty) ? ListView.builder(
                itemCount: filterInfoCities.length,
                itemBuilder: (context, index){
                  return Card(
                    color: getStatusColor(index),
                    child: Column(
                      children: [
                        Text(filterInfoCities[index].city,
                            style: TextStyle(
                                fontSize: 20.0
                            )),
                        SizedBox(height: 4.0),
                        Text(filterInfoCities[index].province,
                            style: TextStyle(
                                fontSize: 10.0
                            )),
                        SizedBox(height: 4.0),
                        Text(filterInfoCities[index].risk),
                      ],
                    ),
                  );
                }
            ) : Center(child: Text('Data not found')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info_outline),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        onPressed: (){
          Toast.show("Weekly update from $date",
              context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
        },
        tooltip: 'Info Weekly Update',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
            ? Center(child: CircularProgressIndicator())
            : riskMapDetail();
  }
}


/*class RiskMapPage extends StatefulWidget {
  @override
  _RiskMapPageState createState() => _RiskMapPageState();
}

class _RiskMapPageState extends State<RiskMapPage> {
  Future<RiskMap> futureRiskMap;

  @override
  void initState() {
    futureRiskMap = fetchRiskMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RiskMap>(
      future: futureRiskMap,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error));
        }
        return (snapshot.hasData)
            ? RiskMapDetail(riskMapData : snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}*/

/*class RiskMapDetail extends StatefulWidget {
  final RiskMap riskMapData;

  RiskMapDetail({Key key, this.riskMapData}) : super(key: key);

  @override
  _RiskMapDetailState createState() => _RiskMapDetailState();
}

class _RiskMapDetailState extends State<RiskMapDetail> {

  List<InfoCity> getListInfoCities(){
    return widget.riskMapData.infoCities;
  }

  Color getStatusColor(int index){
    switch(widget.riskMapData.infoCities[index].risk){
      case 'RESIKO TINGGI':
        return Colors.red;
      case 'RESIKO SEDANG':
        return Colors.orange;
      case 'RESIKO RENDAH':
        return Colors.yellow;
      case 'TIDAK ADA KASUS':
        return Colors.lightGreen;
      case 'TIDAK TERDAMPAK':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            heightFactor: 4.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Weekly Update'),
                Text(widget.riskMapData.date)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: getListInfoCities().length,
                itemBuilder: (context, index){
                  return Card(
                    color: getStatusColor(index),
                    child: Column(
                      children: [
                        Text(getListInfoCities()[index].city,
                            style: TextStyle(
                            fontSize: 20.0
                        )),
                        SizedBox(height: 4.0),
                        Text(getListInfoCities()[index].province,
                            style: TextStyle(
                            fontSize: 10.0
                        )),
                        SizedBox(height: 4.0),
                        Text(getListInfoCities()[index].risk),
                      ],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}*/


