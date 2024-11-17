import 'package:flutter/material.dart';
import 'package:news_app/combonents/CategoriesListViewCards.dart';
import 'package:news_app/widgets/CategoryCard.dart';

import 'package:news_app/models/models.dart';
import 'package:news_app/widgets/CategoryCard.dart';

class Categoriescarditems extends StatelessWidget {
  final List<horizintal> HorezontalLis = const [
    horizintal(
      image: 'assets/images/business.jpg',
      CategoryName: 'Business',
    ),
    horizintal(
      image: 'assets/images/entertaiment.jpg',
      CategoryName: 'Entertainment',
    ),
    horizintal(
      image: 'assets/images/general.jpg',
      CategoryName: 'General',
    ),
    horizintal(
      image: 'assets/images/health.jpg',
      CategoryName: 'Health',
    ),
    horizintal(
      image: 'assets/images/science.jpg',
      CategoryName: 'Science',
    ),
    horizintal(
      image: 'assets/images/sports.jpg',
      CategoryName: 'Sports',
    ),
    horizintal(
      image: 'assets/images/technology.jpg',
      CategoryName: 'Technology',
    ),
  ];
  const Categoriescarditems({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: HorezontalLis.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoriesListViewCards(
            horzObj: HorezontalLis[index],
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Categorycard(
                  Category: HorezontalLis[index].CategoryName,
                );
              }));
            },
          );
        },
      ),
    );
  }
}
