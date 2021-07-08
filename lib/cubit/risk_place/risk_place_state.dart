import 'package:coronaindonesiatracker/data/model/risk_places.dart';

abstract class RiskPlaceState {
  const RiskPlaceState();
}

class RiskPlaceInit extends RiskPlaceState {
  const RiskPlaceInit();
}

class RiskPlaceLoading extends RiskPlaceState {
  const RiskPlaceLoading();
}

class RiskPlaceLoaded extends RiskPlaceState {
  final RiskPlace riskPlace;
  const RiskPlaceLoaded(this.riskPlace);
}

class RiskPlaceError extends RiskPlaceState {
  final String message;
  const RiskPlaceError(this.message);
}
