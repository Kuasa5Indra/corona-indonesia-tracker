import 'package:coronaindonesiatracker/data/model/daily_update.dart';

abstract class DailyUpdateState {
  const DailyUpdateState();
}

class DailyUpdateInit extends DailyUpdateState {
  const DailyUpdateInit();
}

class DailyUpdateLoading extends DailyUpdateState {
  const DailyUpdateLoading();
}

class DailyUpdateLoaded extends DailyUpdateState {
  final DailyData dailyData;
  const DailyUpdateLoaded(this.dailyData);
}

class DailyUpdateError extends DailyUpdateState {
  final String message;
  const DailyUpdateError(this.message);
}
