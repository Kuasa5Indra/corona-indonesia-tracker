/// Kelas ini berisi Public API dari Satgas Covid beserta endpoint dalam bentuk json

class API {
  final String base_url = 'https://data.covid19.go.id/public/api/';
  String get dailyUpdate => base_url + 'update.json';
  String get dailyReport => base_url + 'pemeriksaan-vaksinasi.json';
  String get infoCases => base_url + 'data.json';
  String get infoProvince => base_url + 'prov.json';
  String get riskLocation => base_url + 'skor.json';
}