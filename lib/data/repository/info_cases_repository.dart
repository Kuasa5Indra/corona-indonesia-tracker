import 'dart:async';
import 'dart:convert';
import 'package:coronaindonesiatracker/api/routes.dart';
import 'package:coronaindonesiatracker/data/model/info_cases.dart';
import 'package:coronaindonesiatracker/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class InfoCasesRepository extends Repository<InfoCases> {
  @override
  Future<InfoCases> fetchData() async {
    final response = await http.get(Uri.parse(API().infoCases));
    return InfoCases.fromJson(json.decode(response.body));
  }

}
