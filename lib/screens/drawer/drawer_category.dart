import 'package:flutter/material.dart';
import 'package:the_scoop/services/supabase_api.dart';

// ignore: must_be_immutable
class CategoriesDrawer extends StatelessWidget {
  CategoriesDrawer({Key? key}) : super(key: key);

  SupaBaseManager supabase = SupaBaseManager();
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
                    context: context,
                    title: "Stocks",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Mutual Funds",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "SIP",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Futures",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Options",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "IPO",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "NFO",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Crypto",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Bitcoin",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "Ethereum",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
                    title: "NFT",
                    image: 'https://picsum.photos/250?image=10',
                  ),
                  _categories(
                    context: context,
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

  Widget _categories(
      {required BuildContext context,
      required String title,
      required String image}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/',
            arguments: supabase.getStockNews(),
          );
        },
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
