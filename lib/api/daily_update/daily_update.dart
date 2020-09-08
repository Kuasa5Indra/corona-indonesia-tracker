/// Link : https://data.covid19.go.id/public/api/update.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class DailyData {
  final _DailyCaseData caseData;
  final _DailyUpdateData updateData;

  DailyData({this.caseData, this.updateData});

  factory DailyData.fromJson(Map<String, dynamic> json){
    return DailyData(
      caseData: _DailyCaseData.fromJson(json['data']),
      updateData: _DailyUpdateData.fromJson(json['update']),
    );
  }

  String getSuspect() => caseData.suspect.toString();
  String getSpecimens() => caseData.specimens.toString();
  String getNegativeSpecimens() => caseData.negativeSpecimens.toString();
  String getUpdateDate() => updateData.getUpdateDate();
  String getUpdatePositiveCases() => updateData.getUpdatePositiveCases();
  String getUpdateTreatedCases() => updateData.getUpdateTreatedCases();
  String getUpdateCuredCases() => updateData.getUpdateCuredCases();
  String getUpdateDeathCases() => updateData.getUpdateDeathCases();
  String getUpdateTotalPositiveCases() => updateData.getUpdateTotalPositiveCases();
  String getUpdateTotalTreatedCases() => updateData.getUpdateTotalTreatedCases();
  String getUpdateTotalCuredCases() => updateData.getUpdateTotalCuredCases();
  String getUpdateTotalDeathCases() => updateData.getUpdateTotalDeathCases();
}

class _DailyCaseData {
  final int suspect;
  final int specimens;
  final int negativeSpecimens;

  _DailyCaseData({this.suspect, this.specimens, this.negativeSpecimens});

  factory _DailyCaseData.fromJson(Map<String, dynamic> json){
    return _DailyCaseData(
      suspect: json['jumlah_odp'],
      specimens: json['total_spesimen'],
      negativeSpecimens: json['total_spesimen_negatif']
    );
  }
}

class _DailyUpdateData {
  final _DailyAdditionalCases additionalCases;
  final _DailyTotalCases totalCases;

  _DailyUpdateData({this.additionalCases, this.totalCases});

  factory _DailyUpdateData.fromJson(Map<String, dynamic> json){
    return _DailyUpdateData(
      additionalCases: _DailyAdditionalCases.fromJson(json['penambahan']),
      totalCases: _DailyTotalCases.fromJson(json['total']),
    );
  }

  String getUpdateDate() => additionalCases.date;
  String getUpdatePositiveCases() => additionalCases.positiveCases.toString();
  String getUpdateTreatedCases() => additionalCases.treatedCases.toString();
  String getUpdateCuredCases() => additionalCases.curedCases.toString();
  String getUpdateDeathCases() => additionalCases.deathCases.toString();
  String getUpdateTotalPositiveCases() => totalCases.totalPositiveCases.toString();
  String getUpdateTotalTreatedCases() => totalCases.totalTreatedCases.toString();
  String getUpdateTotalCuredCases() => totalCases.totalCuredCases.toString();
  String getUpdateTotalDeathCases() => totalCases.totalDeathCases.toString();
}

class _DailyAdditionalCases {
  final String date;
  final int positiveCases;
  final int treatedCases;
  final int curedCases;
  final int deathCases;

  _DailyAdditionalCases(
      {this.date,
      this.positiveCases,
      this.treatedCases,
      this.curedCases,
      this.deathCases});

  factory _DailyAdditionalCases.fromJson(Map<String, dynamic> json){
    return _DailyAdditionalCases(
      date: json['tanggal'],
      positiveCases: json['jumlah_positif'],
      treatedCases: json['jumlah_dirawat'],
      curedCases: json['jumlah_sembuh'],
      deathCases: json['jumlah_meninggal'],
    );
  }
}

class _DailyTotalCases {
  final int totalPositiveCases;
  final int totalTreatedCases;
  final int totalCuredCases;
  final int totalDeathCases;

  _DailyTotalCases({this.totalPositiveCases, this.totalTreatedCases,
    this.totalCuredCases, this.totalDeathCases});

  factory _DailyTotalCases.fromJson(Map<String, dynamic> json){
    return _DailyTotalCases(
      totalPositiveCases: json['jumlah_positif'],
      totalTreatedCases: json['jumlah_dirawat'],
      totalCuredCases: json['jumlah_sembuh'],
      totalDeathCases: json['jumlah_meninggal'],
    );
  }
}
