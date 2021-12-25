import 'package:flutter/material.dart';
import 'package:the_scoop/screens/drawer/drawer_main.dart';
import 'package:the_scoop/screens/feed/new_webview.dart';
import 'package:the_scoop/screens/feed/news_card.dart';

class NewsFeed extends StatelessWidget {
  NewsFeed({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            const DrawerMain(),
            PageView.builder(
              scrollDirection: Axis.vertical,
              //physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(controller: _controller);
              },
            ),
            NewsWebView(
              controller: _controller,
            ),
          ],
        ),
      ),
      //drawer: const DrawerMain(),
    );
  }
}
