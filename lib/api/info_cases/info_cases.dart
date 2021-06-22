import 'package:coronaindonesiatracker/api/info_cases/category/category.dart';
/// Link : https://data.covid19.go.id/public/api/data.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class InfoCases {
  final String lastUpdate;
  final Cases infoConfirmed;
  final Cases infoTreated;
  final Cases infoCured;
  final Cases infoDeath;

  InfoCases(
      {required this.lastUpdate,
      required this.infoConfirmed,
      required this.infoTreated,
      required this.infoCured,
      required this.infoDeath});

  factory InfoCases.fromJson(Map<String, dynamic> json){
    return InfoCases(
      lastUpdate: json['last_update'],
      infoConfirmed: Cases.fromJson(json['kasus']),
      infoTreated: Cases.fromJson(json['perawatan']),
      infoCured: Cases.fromJson(json['sembuh']),
      infoDeath: Cases.fromJson(json['meninggal']),
    );
  }
}

class Cases {
  final PatientCategory condition;
  final PatientCategory ageGroup;
  final PatientCategory gender;
  final PatientCategory symptoms;

  Cases(
      {required this.condition,
        required this.ageGroup,
        required this.gender,
        required this.symptoms});

  factory Cases.fromJson(Map<String, dynamic> json){
    return Cases(
      condition: PatientCategory.fromJson(json['kondisi_penyerta']),
      ageGroup: PatientCategory.fromJson(json['kelompok_umur']),
      gender: PatientCategory.fromJson(json['jenis_kelamin']),
      symptoms: PatientCategory.fromJson(json['gejala']),
    );
  }

  getListCondition() => condition.listData;
  getListAgeGroup() => ageGroup.listData;
  getListGender() => gender.listData;
  getListSymptoms() => symptoms.listData;
}