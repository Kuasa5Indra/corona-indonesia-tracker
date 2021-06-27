/// Link : https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class ReportData {
  final TestingReportData testingReportData;
  final VaccinationReportData vaccinationReportData;

  ReportData({required this.testingReportData, required this.vaccinationReportData});

  factory ReportData.fromJson(Map<String, dynamic> json){
    return ReportData(
        testingReportData: TestingReportData.fromJson(json['pemeriksaan']),
        vaccinationReportData: VaccinationReportData.fromJson(json['vaksinasi'])
    );
  }

  String getUpdateTestingDate() => testingReportData.additionalTesting.date;
  String getUpdateVaccinationDate() => vaccinationReportData.additionalVaccination.date;
  String getAdditionalPCRSpecimen() => testingReportData.additionalTesting.pcrSpecimen.toString();
  String getAdditionalAntigenSpecimen() => testingReportData.additionalTesting.antigenSpecimen.toString();
  String getTotalPCRSpecimen() => testingReportData.totalTesting.totalPCRSpecimen.toString();
  String getTotalAntigenSpecimen() => testingReportData.totalTesting.totalAntigenSpecimen.toString();
  String getAdditionalPCRTested() => testingReportData.additionalTesting.pcrTested.toString();
  String getAdditionalAntigenTested() => testingReportData.additionalTesting.antigenTested.toString();
  String getTotalPCRTested() => testingReportData.totalTesting.totalPCRTested.toString();
  String getTotalAntigenTested() => testingReportData.totalTesting.totalAntigenTested.toString();
  String getAdditionalSpecimen() {
    var additionSpecimen = testingReportData.additionalTesting.pcrSpecimen + testingReportData.additionalTesting.antigenSpecimen;
    return additionSpecimen.toString();
  }
  String getAdditionalPeopleTested() {
    var additionPeopleTested = testingReportData.additionalTesting.pcrTested + testingReportData.additionalTesting.antigenTested;
    return additionPeopleTested.toString();
  }
  String getTotalSpecimen() {
    var totalSpecimen = testingReportData.totalTesting.totalPCRSpecimen + testingReportData.totalTesting.totalAntigenSpecimen;
    return totalSpecimen.toString();
  }
  String getTotalPeopleTested() {
    var totalPeopleTested = testingReportData.totalTesting.totalPCRTested + testingReportData.totalTesting.totalAntigenTested;
    return totalPeopleTested.toString();
  }
  String getAdditionalFirstVaccine() => vaccinationReportData.additionalVaccination.firstVaccination.toString();
  String getAdditionalSecondVaccine() => vaccinationReportData.additionalVaccination.secondVaccination.toString();
  String getTotalFirstVaccine() => vaccinationReportData.totalVaccination.totalFirstVaccination.toString();
  String getTotalSecondVaccine() => vaccinationReportData.totalVaccination.totalSecondVaccination.toString();
}

class TestingReportData {
  final _AdditionalTestingData additionalTesting;
  final _TotalTestingData totalTesting;

  TestingReportData({required this.additionalTesting, required this.totalTesting});

  factory TestingReportData.fromJson(Map<String, dynamic> json){
    return TestingReportData(
        additionalTesting: _AdditionalTestingData.fromJson(json['penambahan']),
        totalTesting: _TotalTestingData.fromJson(json['total'])
    );
  }
}

class VaccinationReportData {
  final _AdditionalVaccinationData additionalVaccination;
  final _TotalVaccinationData totalVaccination;

  VaccinationReportData(
      {required this.additionalVaccination, required this.totalVaccination});
  
  factory VaccinationReportData.fromJson(Map<String, dynamic> json){
    return VaccinationReportData(
        additionalVaccination: _AdditionalVaccinationData.fromJson(json['penambahan']), 
        totalVaccination: _TotalVaccinationData.fromJson(json['total'])
    );
  }
}

class _AdditionalTestingData {
  final String date;
  final int pcrSpecimen;
  final int antigenSpecimen;
  final int pcrTested;
  final int antigenTested;

  _AdditionalTestingData(
      { required this.date,
      required this.pcrSpecimen,
      required this.antigenSpecimen,
      required this.pcrTested,
      required this.antigenTested});

  factory _AdditionalTestingData.fromJson(Map<String, dynamic> json){
    return _AdditionalTestingData(
        date: json['tanggal'],
        pcrSpecimen: json['jumlah_spesimen_pcr_tcm'],
        antigenSpecimen: json['jumlah_spesimen_antigen'],
        pcrTested: json['jumlah_orang_pcr_tcm'],
        antigenTested: json['jumlah_orang_antigen']
    );
  }
}

class _TotalTestingData {
  final int totalPCRSpecimen;
  final int totalAntigenSpecimen;
  final int totalPCRTested;
  final int totalAntigenTested;

  _TotalTestingData(
      {required this.totalPCRSpecimen,
      required this.totalAntigenSpecimen,
      required this.totalPCRTested,
      required this.totalAntigenTested});

  factory _TotalTestingData.fromJson(Map<String, dynamic> json){
    return _TotalTestingData(
        totalPCRSpecimen: json['jumlah_spesimen_pcr_tcm'],
        totalAntigenSpecimen: json['jumlah_spesimen_antigen'],
        totalPCRTested: json['jumlah_orang_pcr_tcm'],
        totalAntigenTested: json['jumlah_orang_antigen']
    );
  }
}

class _AdditionalVaccinationData{
  final String date;
  final int firstVaccination;
  final int secondVaccination;

  _AdditionalVaccinationData(
      {required this.date, required this.firstVaccination, required this.secondVaccination});

  factory _AdditionalVaccinationData.fromJson(Map<String, dynamic> json){
    return _AdditionalVaccinationData(
        date: json['tanggal'],
        firstVaccination: json['jumlah_vaksinasi_1'],
        secondVaccination: json['jumlah_vaksinasi_2']
    );
  }
}

class _TotalVaccinationData{
  final int totalFirstVaccination;
  final int totalSecondVaccination;

  _TotalVaccinationData(
      {required this.totalFirstVaccination, required this.totalSecondVaccination});

  factory _TotalVaccinationData.fromJson(Map<String, dynamic> json){
    return _TotalVaccinationData(
        totalFirstVaccination: json['jumlah_vaksinasi_1'],
        totalSecondVaccination: json['jumlah_vaksinasi_2']
    );
  }
}
