/// Link : https://data.covid19.go.id/public/api/skor.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class RiskPlace {
  final String date;
  final List<InfoCity> infoCities;

  RiskPlace({required this.date, required this.infoCities});

  factory RiskPlace.fromJson(Map<String, dynamic> json){
    return RiskPlace(
      date: json['tanggal'],
      infoCities: parseListInfoCity(json)
    );
  }

  static List<InfoCity> parseListInfoCity(json){
    var list = json['data'] as List;
    List<InfoCity> infoList = list.map((data) => InfoCity.fromJson(data)).toList();
    return infoList;
  }
}

class InfoCity {
  final String province;
  final String city;
  final String risk;

  InfoCity({required this.province, required this.city, required this.risk});

  factory InfoCity.fromJson(Map<String, dynamic> json){
    return InfoCity(
      province: json['prov'],
      city: json['kota'],
      risk: json['hasil']
    );
  }
}