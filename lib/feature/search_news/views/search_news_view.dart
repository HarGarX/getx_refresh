import 'package:flutter/material.dart';
import '../../../core/widgets/drawer.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search News"),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}
