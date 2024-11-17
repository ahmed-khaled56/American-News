import 'package:dio/dio.dart';
import 'package:news_app/models/articel_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticelModel>> getTopHeadLinesNews(
      {required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=bc6a9dd66f464b7c8cbbc5b6495c212b');

      Map<String, dynamic> Josondata = response.data;
      List<dynamic> articles = Josondata['articles'];
      List<ArticelModel> articlesList = [];

      for (var article in articles) {
        ArticelModel articelmodel = ArticelModel(
          image: article['urlToImage'] ??
              'https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_960_720.jpg',
          title: article['title'] ?? 'Enter to View the News ',
          subtitle: article['description'] ?? 'Enter to View the News ',
          detailes: article['url'] ?? 'No more detailes ',
        );
        articlesList.add(articelmodel);
      }
      return articlesList;
    } catch (e) {
      return []; //empty list
    }
  }
}
