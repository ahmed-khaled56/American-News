import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/combonents/CategoryView.dart';
import 'package:news_app/combonents/ViewDetailesNews.dart';

import 'package:news_app/models/articel_model.dart';
import 'package:news_app/services/News_service.dart';

class categoriesList extends StatelessWidget {
  final List<ArticelModel> articelesList;
  const categoriesList({super.key, required this.articelesList});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articelesList.length,
        (context, index) {
          return catgoryView(
            articelModel: articelesList[index],
            ontap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Viewdetailesnews(obj: articelesList[index].detailes);
              }));
            },
          );
        },
      ),
    );
  }
}
