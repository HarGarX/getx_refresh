import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_refresh/feature/search_news/controller/search_news_controller.dart';
import '../../../core/widgets/drawer.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final searchController = Get.find<SearchNewsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextField(
          controller: searchController.searchTextController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: Obx(() {
            return searchController.isLoading.isTrue
                ? Center(child: CircularProgressIndicator())
                : searchController.articles == null
                    ? const Center(
                        child: Text("No News Found"),
                      )
                    : Container(
                        margin: const EdgeInsets.all(10.0),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(searchController
                                          .articles![index]?.urlToImage ??
                                      ''),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    searchController.articles![index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    searchController
                                        .articles![index].description,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: searchController.articles!.length),
                      );
          }),
        ),
      ]),
    );
  }
}
