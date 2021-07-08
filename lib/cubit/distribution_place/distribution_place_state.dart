import 'package:coronaindonesiatracker/data/model/distribution_places.dart';

abstract class DistributionPlaceState {
  const DistributionPlaceState();
}

class DistributionPlaceInit extends DistributionPlaceState{
  const DistributionPlaceInit();
}

class DistributionPlaceLoading extends DistributionPlaceState{
  const DistributionPlaceLoading();
}

class DistributionPlaceLoaded extends DistributionPlaceState{
  final DistributionPlace distributionPlace;
  const DistributionPlaceLoaded(this.distributionPlace);
}

class DistributionPlaceError extends DistributionPlaceState{
  final String message;
  const DistributionPlaceError(this.message);
}
