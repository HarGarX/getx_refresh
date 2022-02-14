import '../model/article_model.dart';

abstract class NewsRepository {
  Future<List<ArticleModel>> getNewsHeadLine();
  Future<List<ArticleModel>> getSearcNews(String query);
}
