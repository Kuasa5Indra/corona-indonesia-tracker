import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'risk_map.dart';

Future<RiskMap> fetchRiskMap() async {
  final response =
  await http.get('https://data.covid19.go.id/public/api/skor.json');
  return RiskMap.fromJson(json.decode(response.body));
}