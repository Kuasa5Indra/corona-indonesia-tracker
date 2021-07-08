import 'package:coronaindonesiatracker/data/model/info_cases.dart';

abstract class InfoCasesState {
  const InfoCasesState();
}

class InfoCasesInit extends InfoCasesState {
  const InfoCasesInit();
}

class InfoCasesLoading extends InfoCasesState {
  const InfoCasesLoading();
}

class InfoCasesLoaded extends InfoCasesState {
  final InfoCases infoCases;
  const InfoCasesLoaded(this.infoCases);
}

class InfoCasesError extends InfoCasesState {
  final String message;
  const InfoCasesError(this.message);
}
