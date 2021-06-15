import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'daily_update.dart';

Future<DailyData> fetchData() async {
  final response =
          await http.get(Uri.parse('https://data.covid19.go.id/public/api/update.json'));
  return DailyData.fromJson(json.decode(response.body));
}