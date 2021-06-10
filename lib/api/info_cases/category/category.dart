import 'package:coronaindonesiatracker/api/info_cases/info_data.dart';

/// Link : https://data.covid19.go.id/public/api/data.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class PatientCategory {
  List<InfoData> listData;

  PatientCategory({this.listData});

  factory PatientCategory.fromJson(Map<String, dynamic> json){
    return PatientCategory(
        listData: parseListInfo(json)
    );
  }

  static List<InfoData> parseListInfo(json){
    var list = json['list_data'] as List;
    List<InfoData> infoList = list.map((data) => InfoData.fromJson(data)).toList();
    return infoList;
  }
}