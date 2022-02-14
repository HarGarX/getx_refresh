import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'feature/news_headline/binding/news_headline_binding.dart';
import 'feature/news_headline/views/news_headline_view.dart';
import 'feature/search_news/binding/search_news_binding.dart';
import 'feature/search_news/views/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: "/news_headline",
          page: () => const NewsHeadLineView(),
          binding: NewsHeadLineBinding(),
        ),
        GetPage(
          name: "/search_news",
          page: () => const SearchNewsView(),
          binding: SearchNewsBinding(),
        ),
      ],
      initialRoute: "/news_headline",
    );
  }
}
