import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coronaindonesiatracker/data/repository/distribution_places_repository.dart';

import 'distribution_place_state.dart';

class DistributionPlaceCubit extends Cubit<DistributionPlaceState> {
  final DistributionPlaceRepository repository;

  DistributionPlaceCubit({required this.repository}) : super(DistributionPlaceInit());

  void getDistributionPlace(){
    try {
      emit(DistributionPlaceLoading());
      repository.fetchData().then((data){
        final distributionPlace = data;
        emit(DistributionPlaceLoaded(distributionPlace));
      }).catchError((e){
        emit(DistributionPlaceError('Something wrong on your network'));
      });
    } on SocketException catch (e){
      print(e.message);
    }
  }
}
