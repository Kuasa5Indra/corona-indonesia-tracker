import 'package:coronaindonesiatracker/data/model/daily_report.dart';

abstract class DailyReportState {
  const DailyReportState();
}

class DailyReportInit extends DailyReportState {
  const DailyReportInit();
}

class DailyReportLoading extends DailyReportState {
  const DailyReportLoading();
}

class DailyReportLoaded extends DailyReportState {
  final ReportData reportData;
  final int positiveCases;

  const DailyReportLoaded(this.reportData, this.positiveCases);
}

class DailyReportError extends DailyReportState {
  final String message;
  const DailyReportError(this.message);
}
