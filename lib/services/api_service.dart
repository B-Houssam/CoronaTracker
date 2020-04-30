import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class ApiService {
  Future<List<Article>> fetchArticles() async {
    try {
      var response = await http.get(
          'https://api.covid19api.com/live/country/algeria/status/confirmed');
      List<dynamic> data = json.decode(response.body);
      List<Article> articles = [];
      data.forEach(
        (articleMap) => articles.add(Article.fromMap(articleMap)),
      );
      return articles;
    } catch (err) {
      throw err.toString();
    }
  }
}
