import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/article.dart';

class ApiService {
  var jsonWorldWide;

  Future<Article> fetchArticles() async {
    try {
      String worldWideUrl = 'https://corona.lmao.ninja/v2/all';
      http.Response response = await http.get(worldWideUrl);
      if (response.statusCode == 200) {
        jsonWorldWide = convert.jsonDecode(response.body);
        //print('$jsonWorldWide');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      Article art = new Article(
          affected: jsonWorldWide['cases'],
          deaths: jsonWorldWide['deaths'],
          recovered: jsonWorldWide['recovered'],
          active: jsonWorldWide['active'],
          serious: jsonWorldWide['critical'],
          tdydeaths: jsonWorldWide['todayDeaths'],
          tdycases: jsonWorldWide['todayCases']);
      return art;
    } catch (err) {
      throw err.toString();
    }
  }
}
