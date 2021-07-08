/// Link : https://data.covid19.go.id/public/api/prov.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class DistributionPlace {
  final String date;
  final List<InfoProvince> listProvince;

  DistributionPlace({required this.date, required this.listProvince});

  factory DistributionPlace.fromJson(Map<String, dynamic> json){
    return DistributionPlace(
      date: json['last_date'],
      listProvince: parseListProvince(json),
    );
  }

  static List<InfoProvince> parseListProvince(json){
    var list = json['list_data'] as List;
    List<InfoProvince> infoList = list.map((data) => InfoProvince.fromJson(data)).toList();
    return infoList;
  }
}

class InfoProvince {
  final String province;
  final double percentage;
  final int totalConfirmedCase;
  final int totalCuredCase;
  final int totalDeathCase;
  final int totalTreatedCase;
  final InfoProvinceCase infoProvinceCase;

  InfoProvince(
      {required this.province,
      required this.percentage,
      required this.totalConfirmedCase,
      required this.totalCuredCase,
      required this.totalDeathCase,
      required this.totalTreatedCase,
      required this.infoProvinceCase
      });

  factory InfoProvince.fromJson(Map<String, dynamic> json){
    return InfoProvince(
      province: json['key'],
      percentage: json['doc_count'],
      totalConfirmedCase: json['jumlah_kasus'],
      totalCuredCase: json['jumlah_sembuh'],
      totalDeathCase: json['jumlah_meninggal'],
      totalTreatedCase: json['jumlah_dirawat'],
      infoProvinceCase: InfoProvinceCase.fromJson(json['penambahan'])
    );
  }
}

class InfoProvinceCase {
  final int confirmedCase;
  final int curedCase;
  final int deathCase;

  InfoProvinceCase({required this.confirmedCase, required this.curedCase, required this.deathCase});

  factory InfoProvinceCase.fromJson(Map<String, dynamic> json){
    return InfoProvinceCase(
      confirmedCase: json['positif'],
      curedCase: json['sembuh'],
      deathCase: json['meninggal']
    );
  }
}
