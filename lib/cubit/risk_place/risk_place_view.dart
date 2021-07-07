import 'package:coronaindonesiatracker/data/repository/risk_places_repository.dart';
import 'package:coronaindonesiatracker/new-page/map_places/risk_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'risk_place_cubit.dart';

class RiskPlacePage extends StatelessWidget {
  final cubit = RiskPlaceCubit(repository: RiskPlaceRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: RiskPlaceScreen(),
    );
  }
}
