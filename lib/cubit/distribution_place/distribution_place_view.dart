import 'package:coronaindonesiatracker/data/repository/distribution_places_repository.dart';
import 'package:coronaindonesiatracker/presentation/map_places/distribution_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'distribution_place_cubit.dart';

class DistributionPlacePage extends StatelessWidget {
  final cubit = DistributionPlaceCubit(repository: DistributionPlaceRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: DistributionPlaceScreen(),
    );
  }
}
