import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/model/article_model.dart';
import '../../../core/repository/news_repository_impl.dart';

class SearchNewsController extends GetxController {
  late NewsRepositoryImpl _newsRepository;
  SearchNewsController() {
    _newsRepository = Get.find<NewsRepositoryImpl>();
    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.isNotEmpty) {
        searchNewsHeadLines();
      }
    });
  }
  RxList<ArticleModel>? articles;
  RxBool isLoading = false.obs;
  final searchTextController = TextEditingController();
  searchNewsHeadLines() async {
    showLoading();
    final result =
        await _newsRepository.getSearcNews(searchTextController.text);
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
