import 'package:coronaindonesiatracker/data/repository/daily_report_repository.dart';
import 'package:coronaindonesiatracker/data/repository/daily_update_repository.dart';
import 'package:coronaindonesiatracker/presentation/homepage/daily_report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'daily_report_cubit.dart';

class DailyReportPage extends StatelessWidget {
  final cubit = DailyReportCubit(dailyReportRepository: DailyReportRepository(),
      dailyUpdateRepository: DailyUpdateRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: DailyReportScreen(),
    );
  }
}
