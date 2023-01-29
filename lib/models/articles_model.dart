// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticlesModel {
  final SourceModel? source;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  ArticlesModel({
    required this.source,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      source: json['source'] ?? "",
      author: json['author'] ?? "",
      description: json['title'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}

class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json['id'] ?? "null",
        name: json['name'] ?? "",
      );
}
