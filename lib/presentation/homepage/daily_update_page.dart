import 'package:coronaindonesiatracker/cubit/daily_update/daily_update_cubit.dart';
import 'package:coronaindonesiatracker/cubit/daily_update/daily_update_state.dart';
import 'package:coronaindonesiatracker/data/model/daily_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DailyUpdateScreen extends StatelessWidget {
  final nf = NumberFormat("###,###", "id_ID");
  DailyUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DailyUpdateCubit>(context).getDailyUpdateData();
    return SafeArea(
        child: BlocBuilder<DailyUpdateCubit, DailyUpdateState>(
          builder: (context, state){
            if(state is DailyUpdateLoading){
              return Center(child: CircularProgressIndicator());
            } else if(state is DailyUpdateLoaded){
              var data = (state).dailyData;
              return screen(data);
            } else {
              return Center(child: Text((state as DailyUpdateError).message));
            }
          },
        )
    );
  }

  Widget screen(DailyData data){
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
                Text('Update Harian'),
                Text(DateFormat.yMMMMd().format(DateTime.parse(data.getUpdateDate())))
              ],
            ),
          ),
          Card(
            color: Colors.red,
            child: ListTile(
              title: Center(
                child: Text('${nf.format(data.getUpdateTotalPositiveCases())}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Column(
                    children: [
                      Text(
                          'Terkonfirmasi',
                          style: TextStyle(color: Colors.white, fontSize: 24)
                      ),
                      Text(
                          '${nf.format(data.getUpdatePositiveCases())} kasus',
                          style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ],
                  )
              ),
            ),
          ),
          Card(
            color: Colors.orange,
            child: ListTile(
              title: Center(
                child: Text('${nf.format(data.getUpdateTotalTreatedCases())}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Column(
                    children: [
                      Text(
                          'Kasus Aktif',
                          style: TextStyle(color: Colors.white, fontSize: 24)
                      ),
                      Text(
                          '${nf.format(data.getUpdateTreatedCases())} kasus',
                          style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ],
                  )
              ),
            ),
          ),
          Card(
            color: Colors.green,
            child: ListTile(
              title: Center(
                child: Text('${nf.format(data.getUpdateTotalCuredCases())}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Column(
                    children: [
                      Text(
                          'Sembuh',
                          style: TextStyle(color: Colors.white, fontSize: 24)
                      ),
                      Text(
                          '${nf.format(data.getUpdateCuredCases())} kasus',
                          style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ],
                  )
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            child: ListTile(
              title: Center(
                child: Text('${nf.format(data.getUpdateTotalDeathCases())}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Column(
                    children: [
                      Text(
                          'Meninggal',
                          style: TextStyle(color: Colors.white, fontSize: 24)
                      ),
                      Text(
                          '${nf.format(data.getUpdateDeathCases())} kasus',
                          style: TextStyle(color: Colors.white, fontSize: 16)
                      ),
                    ],
                  )
              ),
            ),
          ),
          Card(
            color: Colors.black,
            child: ListTile(
              title: Center(
                child: Text('${nf.format(data.getSuspect())}',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Text(
                      'Suspek',
                      style: TextStyle(color: Colors.white, fontSize: 24)
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
          Align(
            alignment: Alignment.center,
            heightFactor: 2.0,
            child: Text('Data Spesimen', style: TextStyle(fontSize: 18)),
          ),
          Card(
            color: Colors.grey,
            child: ListTile(
              title: Center(
                child: Text('Total Spesimen',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Text('${nf.format(data.getSpecimens())}',
                      style: TextStyle(color: Colors.white, fontSize: 24)
                  )
              ),
            ),
          ),
          Card(
            color: Colors.grey,
            child: ListTile(
              title: Center(
                child: Text('Spesimen Negatif',
                    style: TextStyle(color: Colors.white, fontSize: 18)
                ),
              ),
              subtitle: Center(
                  child: Text('${nf.format(data.getNegativeSpecimens())}',
                      style: TextStyle(color: Colors.white, fontSize: 24)
                  )
              ),
            ),
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
