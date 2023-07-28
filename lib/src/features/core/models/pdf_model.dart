class PdfModel {
  final String name;
  final String url;

  PdfModel({required this.name, required this.url});

  factory PdfModel.fromMap(Map<String, dynamic> map) {
    return PdfModel(
      name: map["name"] ?? "", // Use the null-aware operator ?? to provide a default value (an empty string in this case)
      url: map["url"] ?? "", // Use the null-aware operator ?? to provide a default value (an empty string in this case)
    );
  }
}
