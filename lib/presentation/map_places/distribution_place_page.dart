import 'package:coronaindonesiatracker/cubit/distribution_place/distribution_place_cubit.dart';
import 'package:coronaindonesiatracker/cubit/distribution_place/distribution_place_state.dart';
import 'package:coronaindonesiatracker/data/model/distribution_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'province_detail_page.dart';

class DistributionPlaceScreen extends StatelessWidget {
  final nf = NumberFormat("###,###", "id_ID");
  DistributionPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DistributionPlaceCubit>(context).getDistributionPlace();
    return SafeArea(
        child: BlocBuilder<DistributionPlaceCubit, DistributionPlaceState>(
          builder: (context, state){
            if(state is DistributionPlaceLoading){
              return Center(child: CircularProgressIndicator());
            } else if(state is DistributionPlaceLoaded){
              var data = (state).distributionPlace;
              return screen(data);
            } else {
              return Center(child: Text((state as DistributionPlaceError).message));
            }
          }
        )
    );
  }

  Widget screen(DistributionPlace distributionPlace){
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          heightFactor: 4.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Update Terbaru'),
              Text(DateFormat.yMMMMd().format(DateTime.parse(distributionPlace.date)))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: distributionPlace.listProvince.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(distributionPlace.listProvince[index].province),
                  subtitle: Text('${nf.format(distributionPlace.listProvince[index].totalConfirmedCase)} kasus'),
                  trailing: Text('${
                      double.parse((distributionPlace.
                      listProvince[index].percentage).toStringAsFixed(2))
                          .toString()} %'),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => ProvinceDetailPage(
                              infoProvince: distributionPlace.listProvince[index],
                            )
                        ));
                  },
                );
              }
          ),
        )
      ],
    );
  }
}



