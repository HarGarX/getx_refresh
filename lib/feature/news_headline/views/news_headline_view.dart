import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_refresh/feature/news_headline/controller/news_headline_controller.dart';
import '../../../core/widgets/drawer.dart';

class NewsHeadLineView extends StatelessWidget {
  const NewsHeadLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _newsController = Get.find<NewsHeadLineController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("News Head Line"),
      ),
      drawer: getAppDrawer(),
      body: Obx(() {
        return _newsController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _newsController.articles[index].urlToImage == null
                              ? Container()
                              : Image.network(
                                  _newsController.articles[index].urlToImage ??
                                      ''),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _newsController.articles[index].title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            _newsController.articles[index].description,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: _newsController.articles.length),
              );
      }),
    );
  }
}
