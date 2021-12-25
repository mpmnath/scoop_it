import 'package:flutter/material.dart';
import 'package:the_scoop/screens/account/account_main.dart';
import 'package:the_scoop/screens/feed/news_feed.dart';

Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  '/': (_) => NewsFeed(),
  '/account': (_) => const AccountMain(),
};
