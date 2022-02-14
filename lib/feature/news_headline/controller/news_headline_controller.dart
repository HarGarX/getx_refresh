import 'package:get/get.dart';

import '../../../core/model/article_model.dart';
import '../../../core/repository/news_repository.dart';
import '../../../core/repository/news_repository_impl.dart';

class NewsHeadLineController extends GetxController {
  late NewsRepositoryImpl _newsRepository;
  NewsHeadLineController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    loadNewsHeadLines();
  }
  late RxList<ArticleModel> articles;
  RxBool isLoading = false.obs;

  loadNewsHeadLines() async {
    showLoading();
    final result = await _newsRepository.getNewsHeadLine();
    hideLoading();
    if (result != null) {
      articles = result.obs;
    } else {
      print("No Data Recived");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
