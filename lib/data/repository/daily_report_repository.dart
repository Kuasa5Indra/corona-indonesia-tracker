import 'dart:async';
import 'dart:convert';
import 'package:coronaindonesiatracker/api/routes.dart';
import 'package:coronaindonesiatracker/data/model/daily_report.dart';
import 'package:coronaindonesiatracker/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class DailyReportRepository extends Repository<ReportData> {
  @override
  Future<ReportData> fetchData() async {
    final response = await http.get(Uri.parse(API().dailyReport));
    return ReportData.fromJson(json.decode(response.body));
  }

}