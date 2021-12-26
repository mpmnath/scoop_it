import 'package:flutter/material.dart';
import 'package:the_scoop/screens/feed/new_webview.dart';

// ignore: must_be_immutable
class NewsCard extends StatefulWidget {
  late PageController controller;
  late dynamic data;
  NewsCard({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool showAppBar = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
/*      appBar: showAppBar
          ? AppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              backgroundColor: Colors.black.withOpacity(0.1),
              shadowColor: Colors.black.withOpacity(0.1),
              leading: const Icon(Icons.menu_open_rounded),
            )
          : null,*/
      body: GestureDetector(
        /*onTap: () {
          setState(() {
            showAppBar = !showAppBar;
          });
        },*/
        child: Column(
          children: [
            widget.data['type'] == 'Image'
                ? Image.network(
                    widget.data['image_link'],
                    width: double.infinity,
                    height: size.height / 2.5,
                    fit: BoxFit.fitWidth,
                  )
                : const Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text("Video"),
                      ),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.data['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    Text(
                      widget.data['body'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: SizedBox(
                width: double.infinity,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data['author'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Created: ${DateTime.parse(widget.data['created_at']).day}/"
                      "${DateTime.parse(widget.data['created_at']).month}/"
                      "${DateTime.parse(widget.data['created_at']).year}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              widget.data['tag'].toString(),
            ),
            InkWell(
              //onTap: () => controller.jumpToPage(2),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(builder: (BuildContext context) {
                    return NewsWebView(
                      //controller: _controller,
                      data: widget.data,
                    );
                  }),
                );
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.transparent.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data['sub_header'],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        "Read more",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
