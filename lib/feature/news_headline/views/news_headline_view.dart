import 'package:flutter/material.dart';
import '../../../core/widgets/drawer.dart';

class NewsHeadLineView extends StatelessWidget {
  const NewsHeadLineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Head Line"),
      ),
      drawer: getAppDrawer(),
      body: Container(),
    );
  }
}
