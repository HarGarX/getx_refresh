import 'package:get/get.dart';
import '../../../core/repository/news_repository.dart';
import '../../../core/repository/news_repository_impl.dart';
import '../controller/news_headline_controller.dart';

class NewsHeadLineBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsRepositoryImpl());
    Get.put(NewsHeadLineController());
  }
}
