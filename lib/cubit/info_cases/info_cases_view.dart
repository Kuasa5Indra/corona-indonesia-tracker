import 'package:coronaindonesiatracker/data/repository/info_cases_repository.dart';
import 'package:coronaindonesiatracker/presentation/info_cases_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'info_cases_cubit.dart';

class InfoCasesPage extends StatelessWidget {
  final cubit = InfoCasesCubit(repository: InfoCasesRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: InfoCasesScreen(),
    );
  }
}
