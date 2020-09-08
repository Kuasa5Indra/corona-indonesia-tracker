/// Link : https://data.covid19.go.id/public/api/prov.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class DistributionMap {
  final String date;
  final List<InfoProvince> listProvince;

  DistributionMap({this.date, this.listProvince});

  factory DistributionMap.fromJson(Map<String, dynamic> json){
    return DistributionMap(
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
      {this.province,
      this.percentage,
      this.totalConfirmedCase,
      this.totalCuredCase,
      this.totalDeathCase,
      this.totalTreatedCase,
      this.infoProvinceCase
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

  InfoProvinceCase({this.confirmedCase, this.curedCase, this.deathCase});

  factory InfoProvinceCase.fromJson(Map<String, dynamic> json){
    return InfoProvinceCase(
      confirmedCase: json['positif'],
      curedCase: json['sembuh'],
      deathCase: json['meninggal']
    );
  }
}
