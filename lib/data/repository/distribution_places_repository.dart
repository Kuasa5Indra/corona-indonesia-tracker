import 'dart:async';
import 'dart:convert';
import 'package:coronaindonesiatracker/api/routes.dart';
import 'package:coronaindonesiatracker/data/model/distribution_places.dart';
import 'package:coronaindonesiatracker/data/repository/repository.dart';
import 'package:http/http.dart' as http;

class DistributionPlaceRepository extends Repository<DistributionPlace> {
  @override
  Future<DistributionPlace> fetchData() async {
    final response = await http.get(Uri.parse(API().infoProvince));
    return DistributionPlace.fromJson(json.decode(response.body));
  }

}