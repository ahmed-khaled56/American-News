import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/combonents/CategoriesList.dart';

import 'package:news_app/models/articel_model.dart';
import 'package:news_app/services/News_service.dart';

class NewsObjectBuild extends StatefulWidget {
  final String category;
  const NewsObjectBuild({
    super.key,
    required this.category,
  });

  @override
  State<NewsObjectBuild> createState() => _NewsObjectBuildState();
}

class _NewsObjectBuildState extends State<NewsObjectBuild> {
  @override
  // List<ArticelModel> articles = [];
  // bool isLoading = true;
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadLinesNews(
      category: widget.category,
    );
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticelModel>>(
        future: future,
        builder: (Context, Snapshot) {
          if (Snapshot.hasData) {
            return categoriesList(
              articelesList: Snapshot.data ?? [],
            );
          } else if (Snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text(
                "Erorr to bring News !!",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  child: RefreshProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        });
  }
}
