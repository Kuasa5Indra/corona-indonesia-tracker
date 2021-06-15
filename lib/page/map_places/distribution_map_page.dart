import 'package:coronaindonesiatracker/api/place/distribution_map.dart';
import 'package:coronaindonesiatracker/api/place/fetch_distribution_map.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'province_detail_page.dart';

class DistributionMapPage extends StatefulWidget {
  @override
  _DistributionMapPageState createState() => _DistributionMapPageState();
}

class _DistributionMapPageState extends State<DistributionMapPage> {
  Future<DistributionMap> futureDistributionMap;

  @override
  void initState() {
    futureDistributionMap = fetchDistributionMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DistributionMap>(
      future: futureDistributionMap,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text(snapshot.error));
        }
        return (snapshot.hasData)
            ? DistributionMapDetail(distributionMapData : snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class DistributionMapDetail extends StatelessWidget {
  final DistributionMap distributionMapData;
  final nf = NumberFormat("###,###", "id_ID");

  DistributionMapDetail({Key key, this.distributionMapData}) : super(key: key);

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
                Text('Daily Update'),
                Text(DateFormat.yMMMMd().format(DateTime.parse(distributionMapData.date)))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: distributionMapData.listProvince.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(distributionMapData.listProvince[index].province),
                    subtitle: Text('${nf.format(distributionMapData.listProvince[index].totalConfirmedCase)} kasus'),
                    trailing: Text('${
                        double.parse((distributionMapData.
                        listProvince[index].percentage).toStringAsFixed(2))
                      .toString()} %'),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => ProvinceDetailPage(
                              infoProvince: distributionMapData.listProvince[index],
                            )
                          ));
                    },
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}

