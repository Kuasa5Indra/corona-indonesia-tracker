import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'distribution_map.dart';

Future<DistributionMap> fetchDistributionMap() async {
  final response =
  await http.get(Uri.parse('https://data.covid19.go.id/public/api/prov.json'));
  return DistributionMap.fromJson(json.decode(response.body));
}