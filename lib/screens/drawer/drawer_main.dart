import 'package:flutter/material.dart';
import 'package:the_scoop/screens/drawer/drawer_category.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 0.0,
        color: Colors.orange,
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/account'),
              child: Ink(
                width: double.infinity,
                height: 80,
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Manjunath Muntha Purushotham",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "Account",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=8'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CategoriesDrawer(),
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("Privacy"),
                  Text("Terms & Conditions"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
