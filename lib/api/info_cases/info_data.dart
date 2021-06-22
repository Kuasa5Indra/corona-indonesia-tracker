/// Link : https://data.covid19.go.id/public/api/data.json
/// Kelas dibawah dibuat berdasarkan tampilan data json

class InfoData {
  final String key;
  final double docCount;

  InfoData({required this.key, required this.docCount});

  factory InfoData.fromJson(Map<String, dynamic> json){
    return InfoData(
      key: json['key'],
      docCount: json['doc_count']
    );
  }
}