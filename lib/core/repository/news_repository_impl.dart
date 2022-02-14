import 'package:get/get.dart';

import '../../service/http_service.dart';
import '../../service/http_service_impl.dart';
import '../model/article_model.dart';
import '../model/news_response_model.dart';
import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  late HttpServiceImpl _httpService;
  NewsRepositoryImpl(
      // this._httpService,
      ) {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }
  @override
  Future<List<ArticleModel>> getNewsHeadLine() async {
    try {
      final response =
          await _httpService.getRequest("/top-headlines?country=us");
      final paresedResponse = NewsResponseModel.fromJson(response.data);
      return paresedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSearcNews(String query) async {
    try {
      final response = await _httpService.getRequest("/everything?q=$query");

      final paresedResponse = NewsResponseModel.fromJson(response.data);
      return paresedResponse.articles;
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
