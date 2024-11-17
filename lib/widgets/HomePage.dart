import 'package:flutter/material.dart';

import 'package:news_app/combonents/CategoriesCardItems.dart';
import 'package:news_app/combonents/NewsobjectsBuild.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              Text(
                "Cloud",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Expanded(
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: Categoriescarditems(),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 20,
                )),
                NewsObjectBuild(
                  category: 'general',
                ),
              ]),
        ),
      ]),
    );
  }
}
