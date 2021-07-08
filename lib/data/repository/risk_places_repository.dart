import 'dart:async';
import 'dart:convert';
import 'package:coronaindonesiatracker/api/routes.dart';
import 'package:coronaindonesiatracker/data/model/risk_places.dart';
import 'package:coronaindonesiatracker/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class RiskPlaceRepository extends Repository<RiskPlace> {
  @override
  Future<RiskPlace> fetchData() async{
    final response = await http.get(Uri.parse(API().riskLocation));
    return RiskPlace.fromJson(json.decode(response.body));
  }

}