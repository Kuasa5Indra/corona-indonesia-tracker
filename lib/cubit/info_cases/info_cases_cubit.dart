import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coronaindonesiatracker/data/repository/info_cases_repository.dart';

import 'info_cases_state.dart';

class InfoCasesCubit extends Cubit<InfoCasesState> {
  final InfoCasesRepository repository;

  InfoCasesCubit({required this.repository}) : super(InfoCasesInit());

  void getInfoCases(){
    try {
      emit(InfoCasesLoading());
      repository.fetchData().then((data){
        final infoCases = data;
        emit(InfoCasesLoaded(infoCases));
      }).catchError((e){
        emit(InfoCasesError('Something wrong on your network'));
      });
    } on SocketException catch (e){
      print(e.message);
    }
  }
}
