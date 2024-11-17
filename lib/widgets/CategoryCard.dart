import 'package:flutter/material.dart';

import 'package:news_app/combonents/NewsobjectsBuild.dart';

class Categorycard extends StatelessWidget {
  final String Category;
  const Categorycard({super.key, required this.Category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              Category,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                NewsObjectBuild(
                  category: Category,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
