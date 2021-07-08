import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coronaindonesiatracker/data/repository/daily_update_repository.dart';

import 'daily_update_state.dart';

class DailyUpdateCubit extends Cubit<DailyUpdateState> {
  final DailyUpdateRepository repository;

  DailyUpdateCubit({required this.repository}) : super(DailyUpdateInit());

  void getDailyUpdateData(){
    try {
      emit(DailyUpdateLoading());
      repository.fetchData().then((data) {
        final dailyData = data;
        emit(DailyUpdateLoaded(dailyData));
      }).catchError((e){
        emit(DailyUpdateError('Something wrong on your network'));
      });
    } on SocketException catch (e) {
      print(e.message);
    }
  }
}
