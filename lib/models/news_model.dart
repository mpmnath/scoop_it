import 'package:flutter/material.dart';
import 'package:the_scoop/services/supabase_api.dart';

class News with ChangeNotifier {
  String? title;
  String? body;
  String? subHeader;
  String? subLink;
  DateTime? date;
  String? type;
  String? imageLink;
  String? videoLink;

  News({
    this.title,
    this.body,
    this.subHeader,
    this.subLink,
    this.date,
    this.type,
    this.imageLink,
    this.videoLink,
  });

  factory News.fromJson(dynamic json) {
    return News(
      title: json['title'],
      body: json['body'],
      subHeader: json['sub_header'],
      subLink: json['sub_link'],
      date: json['created_at'],
      type: json['type'],
      imageLink: json['image_link'],
      videoLink: json['video_link'],
    );
  }

  fetchNews() {
    SupaBaseManager supabase = SupaBaseManager();
    print("printing news");
    print(News.fromJson(supabase.getData()));
  }
}
