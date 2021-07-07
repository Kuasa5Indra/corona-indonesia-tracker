import 'package:coronaindonesiatracker/data/repository/daily_update_repository.dart';
import 'package:coronaindonesiatracker/new-page/homepage/daily_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'daily_update_cubit.dart';

class DailyUpdatePage extends StatelessWidget {
  final cubit = DailyUpdateCubit(repository: DailyUpdateRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: DailyUpdateScreen(),
    );
  }
}
