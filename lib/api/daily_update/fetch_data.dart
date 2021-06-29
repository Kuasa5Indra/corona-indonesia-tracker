import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'daily_update.dart';
import 'daily_report.dart';

Future<DailyData> fetchDailyUpdate() async {
  final response =
          await http.get(Uri.parse('https://data.covid19.go.id/public/api/update.json'));
  return DailyData.fromJson(json.decode(response.body));
}

Future<ReportData> fetchReportData() async {
  final response =
  await http.get(Uri.parse('https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json'));

  return ReportData.fromJson(json.decode(response.body));
}