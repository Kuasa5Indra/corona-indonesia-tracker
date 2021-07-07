/// Kelas ini berisi Public API dari Satgas Covid beserta endpoint dalam bentuk json

class API {
  final String baseURL = 'https://data.covid19.go.id/public/api/';
  String get dailyUpdate => baseURL + 'update.json';
  String get dailyReport => baseURL + 'pemeriksaan-vaksinasi.json';
  String get infoCases => baseURL + 'data.json';
  String get infoProvince => baseURL + 'prov.json';
  String get riskLocation => baseURL + 'skor.json';
}