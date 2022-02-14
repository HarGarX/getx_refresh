import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel {
  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int totalResults;

  @JsonKey(name: "articles")
  List<ArticleModel> articles;
  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseModelToJson(this);
}
