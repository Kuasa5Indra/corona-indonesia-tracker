import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coronaindonesiatracker/data/model/risk_places.dart';
import 'package:coronaindonesiatracker/data/repository/risk_places_repository.dart';

import 'risk_place_state.dart';

class RiskPlaceCubit extends Cubit<RiskPlaceState> {
  final RiskPlaceRepository repository;
  RiskPlace? riskPlace;
  List<InfoCity>? infoCities;
  RiskPlaceCubit({required this.repository}) : super(RiskPlaceInit());

  void getRiskPlace(){
    try {
      emit(RiskPlaceLoading());
      repository.fetchData().then((data){
        riskPlace = data;
        infoCities = data.infoCities;
        infoCities!.sort((a, b) => a.city.compareTo(b.city));
        emit(RiskPlaceLoaded(riskPlace!));
      }).catchError((e){
        emit(RiskPlaceError('Something wrong on your network'));
      });
    } on SocketException catch (e){
      print(e.message);
    }
  }

  void getFilterInfoCities(String value){
   var filtered = infoCities!.where((data) =>
    data.city.toLowerCase().contains(value.toLowerCase()) ||
        data.province.toLowerCase().contains(value.toLowerCase()) ||
        data.risk.toLowerCase().contains(value.toLowerCase())
    ).toList();
   var filteredRiskPlace = RiskPlace(date: riskPlace!.date, infoCities: filtered);
   emit(RiskPlaceLoaded(filteredRiskPlace));
  }
}
