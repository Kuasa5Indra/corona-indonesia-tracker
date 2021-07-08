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

  String getUpdateTestingDate() => testingReportData.getUpdateTestingDate();
  String getUpdateVaccinationDate() => vaccinationReportData.getUpdateVaccinationDate();
  int getAdditionalPCRSpecimen() => testingReportData.getAdditionalPCRSpecimen();
  int getAdditionalAntigenSpecimen() => testingReportData.getAdditionalAntigenSpecimen();
  int getTotalPCRSpecimen() => testingReportData.getTotalPCRSpecimen();
  int getTotalAntigenSpecimen() => testingReportData.getTotalAntigenSpecimen();
  int getAdditionalPCRTested() => testingReportData.getAdditionalPCRTested();
  int getAdditionalAntigenTested() => testingReportData.getAdditionalAntigenTested();
  int getTotalPCRTested() => testingReportData.getTotalPCRTested();
  int getTotalAntigenTested() => testingReportData.getTotalAntigenTested();
  int getAdditionalSpecimen() => testingReportData.getAdditionalPCRSpecimen() + testingReportData.getAdditionalAntigenSpecimen();
  int getAdditionalPeopleTested() => testingReportData.getAdditionalPCRTested() + testingReportData.getAdditionalAntigenTested();
  int getTotalSpecimen() => testingReportData.getTotalPCRSpecimen() + testingReportData.getTotalAntigenSpecimen();
  int getTotalPeopleTested() => testingReportData.getTotalPCRTested() + testingReportData.getTotalAntigenTested();
  int getAdditionalFirstVaccine() => vaccinationReportData.getAdditionalFirstVaccine();
  int getAdditionalSecondVaccine() => vaccinationReportData.getAdditionalSecondVaccine();
  int getTotalFirstVaccine() => vaccinationReportData.getTotalFirstVaccine();
  int getTotalSecondVaccine() => vaccinationReportData.getTotalSecondVaccine();
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

  String getUpdateTestingDate() => additionalTesting.date;
  int getAdditionalPCRSpecimen() => additionalTesting.pcrSpecimen;
  int getAdditionalAntigenSpecimen() => additionalTesting.antigenSpecimen;
  int getTotalPCRSpecimen() => totalTesting.totalPCRSpecimen;
  int getTotalAntigenSpecimen() => totalTesting.totalAntigenSpecimen;
  int getAdditionalPCRTested() => additionalTesting.pcrTested;
  int getAdditionalAntigenTested() => additionalTesting.antigenTested;
  int getTotalPCRTested() => totalTesting.totalPCRTested;
  int getTotalAntigenTested() => totalTesting.totalAntigenTested;
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

  String getUpdateVaccinationDate() => additionalVaccination.date;
  int getAdditionalFirstVaccine() => additionalVaccination.firstVaccination;
  int getAdditionalSecondVaccine() => additionalVaccination.secondVaccination;
  int getTotalFirstVaccine() => totalVaccination.totalFirstVaccination;
  int getTotalSecondVaccine() => totalVaccination.totalSecondVaccination;
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
