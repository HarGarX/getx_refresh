import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "urlToImage")
  String urlToImage;

  @JsonKey(name: "publishedAt")
  String publishedAt;

  @JsonKey(name: "content")
  String? content;
  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  DateTime? get getPublishedAt => DateTime.tryParse(publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
