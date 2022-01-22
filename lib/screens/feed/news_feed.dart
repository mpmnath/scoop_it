import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_scoop/models/news_model.dart';
import 'package:the_scoop/screens/drawer/drawer_main.dart';
import 'package:the_scoop/screens/feed/news_card.dart';
import 'package:the_scoop/services/supabase_api.dart';

// ignore: must_be_immutable
class NewsFeed extends StatefulWidget {
  NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  final PageController _controller = PageController(initialPage: 1);

  SupaBaseManager supabase = SupaBaseManager();

  News news = News();
  @override
  void initState() {
    super.initState();
    //print(news.fetchNews());
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _newsFeedKey = GlobalKey<ScaffoldState>();

/*    Future<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Future<dynamic>;

    if (args == null) {
      args = supabase.getData();
    } else {
      args = args;
    }*/

    return Scaffold(
      key: _newsFeedKey,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.black.withOpacity(0.1),
        shadowColor: Colors.black.withOpacity(0.1),
        elevation: 0,
        toolbarHeight: 40,
        leading: InkWell(
          onTap: () {
            _newsFeedKey.currentState!.openDrawer();
          },
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.menu_rounded),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(Icons.file_upload),
          )
        ],
      ),
      drawer: const DrawerMain(),
/*      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.bookmark,
                size: 30,
              ),
              Icon(
                Icons.bookmark,
                size: 30,
              ),
              Icon(
                Icons.bookmark,
                size: 30,
              ),
            ],
          ),
        ),
      ),*/
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: FutureBuilder(
            future: supabase.getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data['data'] != null) {
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                      controller: _controller,
                      data: snapshot.data['data'][index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshProducts(BuildContext context) async {
    return supabase.getData();
  }
}
