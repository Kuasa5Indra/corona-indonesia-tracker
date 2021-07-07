/// Link : https://data.covid19.go.id/public/api/update.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class DailyData {
  final _DailyCaseData caseData;
  final _DailyUpdateData updateData;

  DailyData({required this.caseData, required this.updateData});

  factory DailyData.fromJson(Map<String, dynamic> json){
    return DailyData(
      caseData: _DailyCaseData.fromJson(json['data']),
      updateData: _DailyUpdateData.fromJson(json['update']),
    );
  }

  int getSuspect() => caseData.suspect;
  int getSpecimens() => caseData.specimens;
  int getNegativeSpecimens() => caseData.negativeSpecimens;
  String getUpdateDate() => updateData.getUpdateDate();
  int getUpdatePositiveCases() => updateData.getUpdatePositiveCases();
  int getUpdateTreatedCases() => updateData.getUpdateTreatedCases();
  int getUpdateCuredCases() => updateData.getUpdateCuredCases();
  int getUpdateDeathCases() => updateData.getUpdateDeathCases();
  int getUpdateTotalPositiveCases() => updateData.getUpdateTotalPositiveCases();
  int getUpdateTotalTreatedCases() => updateData.getUpdateTotalTreatedCases();
  int getUpdateTotalCuredCases() => updateData.getUpdateTotalCuredCases();
  int getUpdateTotalDeathCases() => updateData.getUpdateTotalDeathCases();
}

class _DailyCaseData {
  final int suspect;
  final int specimens;
  final int negativeSpecimens;

  _DailyCaseData({required this.suspect, required this.specimens, required this.negativeSpecimens});

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

  _DailyUpdateData({required this.additionalCases, required this.totalCases});

  factory _DailyUpdateData.fromJson(Map<String, dynamic> json){
    return _DailyUpdateData(
      additionalCases: _DailyAdditionalCases.fromJson(json['penambahan']),
      totalCases: _DailyTotalCases.fromJson(json['total']),
    );
  }

  String getUpdateDate() => additionalCases.date;
  int getUpdatePositiveCases() => additionalCases.positiveCases;
  int getUpdateTreatedCases() => additionalCases.treatedCases;
  int getUpdateCuredCases() => additionalCases.curedCases;
  int getUpdateDeathCases() => additionalCases.deathCases;
  int getUpdateTotalPositiveCases() => totalCases.totalPositiveCases;
  int getUpdateTotalTreatedCases() => totalCases.totalTreatedCases;
  int getUpdateTotalCuredCases() => totalCases.totalCuredCases;
  int getUpdateTotalDeathCases() => totalCases.totalDeathCases;
}

class _DailyAdditionalCases {
  final String date;
  final int positiveCases;
  final int treatedCases;
  final int curedCases;
  final int deathCases;

  _DailyAdditionalCases(
      {required this.date,
      required this.positiveCases,
      required this.treatedCases,
      required this.curedCases,
      required this.deathCases});

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

  _DailyTotalCases({required this.totalPositiveCases, required this.totalTreatedCases,
    required this.totalCuredCases, required this.totalDeathCases});

  factory _DailyTotalCases.fromJson(Map<String, dynamic> json){
    return _DailyTotalCases(
      totalPositiveCases: json['jumlah_positif'],
      totalTreatedCases: json['jumlah_dirawat'],
      totalCuredCases: json['jumlah_sembuh'],
      totalDeathCases: json['jumlah_meninggal'],
    );
  }
}
