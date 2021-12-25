import 'package:flutter/material.dart';

class CategoriesDrawer extends StatelessWidget {
  const CategoriesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                children: [
                  _categories(
                    title: "Stocks",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Mutual Funds",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "SIP",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Futures",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Options",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "IPO",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "NFO",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Crypto",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Bitcoin",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Ethereum",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "NFT",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    title: "Web 3.0",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categories({required String title, required String image}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
          alignment: Alignment.bottomLeft,
          width: 110,
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
