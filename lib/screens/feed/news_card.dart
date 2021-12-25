import 'package:flutter/material.dart';
import 'package:the_scoop/screens/feed/new_webview.dart';

// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  late PageController controller;
  NewsCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.network(
          'https://picsum.photos/250?image=9',
          width: double.infinity,
          height: size.height / 2.5,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Scoop is under work",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing "
                  "and typesetting industry. Lorem Ipsum has been the industry's "
                  "standard dummy text ever since the 1500s, when an unknown "
                  "printer took a galley of type and scrambled it to make a type "
                  "specimen book. It has survived not only five centuries, but "
                  "also the leap into electronic typesetting, remaining essentially "
                  "unchanged. It was popularised in the 1960s with the release of "
                  "Letraset sheets containing Lorem Ipsum passages, and more recently "
                  "with desktop publishing software like Aldus PageMaker including "
                  "versions of Lorem Ipsum.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => controller.jumpToPage(2),
          child: Container(
            height: 70,
            width: double.infinity,
            color: Colors.transparent.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Stock Surge High to 100%",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Read more",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
