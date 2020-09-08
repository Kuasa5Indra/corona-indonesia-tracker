import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'info_cases.dart';

Future<InfoCases> fetchInfoCases() async {
  final response =
  await http.get('https://data.covid19.go.id/public/api/data.json');
  return InfoCases.fromJson(json.decode(response.body));
}