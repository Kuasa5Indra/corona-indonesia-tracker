import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:coronaindonesiatracker/data/model/daily_report.dart';
import 'package:coronaindonesiatracker/data/model/daily_update.dart';
import 'package:coronaindonesiatracker/data/repository/daily_report_repository.dart';
import 'package:coronaindonesiatracker/data/repository/daily_update_repository.dart';

import 'daily_report_state.dart';

class DailyReportCubit extends Cubit<DailyReportState> {
  final DailyReportRepository dailyReportRepository;
  final DailyUpdateRepository dailyUpdateRepository;

  DailyReportCubit(
      {required this.dailyReportRepository,
        required this.dailyUpdateRepository}) : super(DailyReportInit());

  void getReportData() async{
    try {
      emit(DailyReportLoading());
      await Future.wait([
        dailyReportRepository.fetchData(),
        dailyUpdateRepository.fetchData()
      ]).then((data){
        final reportData = (data[0] as ReportData);
        final positiveCases = (data[1] as DailyData).getUpdatePositiveCases();
        emit(DailyReportLoaded(reportData, positiveCases));
      }).catchError((e){
        emit(DailyReportError('Something wrong on your network'));
      });
    } on SocketException catch (e) {
      print(e.message);
    }
  }
}
