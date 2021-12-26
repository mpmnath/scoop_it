import 'package:flutter/material.dart';
import 'package:the_scoop/screens/drawer/drawer_main.dart';
import 'package:the_scoop/screens/feed/news_card.dart';
import 'package:the_scoop/services/supabase_api.dart';

// ignore: must_be_immutable
class NewsFeed extends StatelessWidget {
  NewsFeed({Key? key}) : super(key: key);

  final PageController _controller = PageController(initialPage: 1);
  SupaBaseManager supabase = SupaBaseManager();

  @override
  Widget build(BuildContext context) {
/*    Future<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Future<dynamic>;

    if (args == null) {
      args = supabase.getData();
    } else {
      args = args;
    }*/

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: supabase.getStockNews(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  const DrawerMain(),
                  PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                        controller: _controller,
                        data: snapshot.data['data'][index],
                      );
                    },
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}
