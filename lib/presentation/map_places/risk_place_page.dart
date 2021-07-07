import 'package:coronaindonesiatracker/cubit/risk_place/risk_place_cubit.dart';
import 'package:coronaindonesiatracker/cubit/risk_place/risk_place_state.dart';
import 'package:coronaindonesiatracker/data/model/risk_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RiskPlaceScreen extends StatefulWidget {
  RiskPlaceScreen({Key? key}) : super(key: key);

  @override
  _RiskPlaceScreenState createState() => _RiskPlaceScreenState();
}

class _RiskPlaceScreenState extends State<RiskPlaceScreen> {
  String? date;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RiskPlaceCubit>(context).getRiskPlace();
    return BlocBuilder<RiskPlaceCubit, RiskPlaceState>(
      builder: (context, state){
        if(state is RiskPlaceLoading){
          return Center(child: CircularProgressIndicator());
        } else if(state is RiskPlaceLoaded){
          date = state.riskPlace.date;
          return screen(context, state.riskPlace.infoCities);
        } else {
          return Center(child: Text((state as RiskPlaceError).message));
        }
      },
    );
  }

  Widget screen(BuildContext context, List<InfoCity> filterInfoCities){
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Masukkan kota, provinsi, atau status resiko',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)
              ),
              onChanged: (value) {
                context.read<RiskPlaceCubit>().getFilterInfoCities(value);
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
            ) : Center(child: Text('Data tidak ditemukan')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info_outline),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        onPressed: (){
          Fluttertoast.showToast(
            msg: "Pembaruan mingguan mulai dari $date",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
          );
        },
        tooltip: 'Info Pembaruan Mingguan',
      ),
    );
  }
}

