import 'package:flutter/material.dart';
import 'package:news_app/models/models.dart';

class CategoriesListViewCards extends StatelessWidget {
  final horizintal horzObj;

  final VoidCallback? ontap;
  const CategoriesListViewCards(
      {super.key, required this.horzObj, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
      width: 180,
      height: 120,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        image: DecorationImage(
          image: AssetImage(horzObj.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: ontap,
          child: Text(
            horzObj.CategoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
