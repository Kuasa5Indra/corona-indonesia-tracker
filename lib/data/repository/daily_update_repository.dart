import 'dart:async';
import 'dart:convert';
import 'package:coronaindonesiatracker/api/routes.dart';
import 'package:http/http.dart' as http;
import 'package:coronaindonesiatracker/data/model/daily_update.dart';
import 'package:coronaindonesiatracker/data/repository/repository.dart';

class DailyUpdateRepository extends Repository<DailyData>{
  @override
  Future<DailyData> fetchData() async {
    final response = await http.get(Uri.parse(API().dailyUpdate));
    return DailyData.fromJson(json.decode(response.body));
  }

}