import 'package:coronaindonesiatracker/api/place/distribution_map.dart';
import 'package:flutter/material.dart';

class ProvinceDetailPage extends StatelessWidget {
  final InfoProvince infoProvince;

  ProvinceDetailPage({Key key, @required this.infoProvince}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Info Provinsi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              heightFactor: 2.0,
              child: Text(infoProvince.province, style: TextStyle(
                fontWeight: FontWeight.bold
              ))
            ),
            Align(
                alignment: Alignment.centerLeft,
                heightFactor: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Terkonfirmasi', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('${infoProvince.totalConfirmedCase.toString()} ('
                        '${infoProvince.infoProvinceCase.confirmedCase})',
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.red
                    ))
                  ],
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                heightFactor: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sembuh', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('${infoProvince.totalCuredCase.toString()} ('
                        '${infoProvince.infoProvinceCase.curedCase})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ))
                  ],
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                heightFactor: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Meninggal', style: TextStyle(
                        fontSize: 20
                    )),
                    Text('${infoProvince.totalDeathCase.toString()} ('
                        '${infoProvince.infoProvinceCase.deathCase})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ))
                  ],
                )
            ),
            Align(
                alignment: Alignment.centerLeft,
                heightFactor: 4.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Perawatan', style: TextStyle(
                        fontSize: 20
                    )),
                    Text(infoProvince.totalTreatedCase.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange
                        ))
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

