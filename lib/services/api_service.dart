import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/article.dart';

class ApiService {
  var jsonWorldWide;
  var jsonData;

  Future<Article> fetchArticles(bool choise, String name) async {
    if (choise) {
      try {
        String worldWideUrl = 'https://corona.lmao.ninja/v3/covid-19/all';
        http.Response response = await http.get(worldWideUrl);
        if (response.statusCode == 200) {
          jsonWorldWide = convert.jsonDecode(response.body);
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
        Article art = new Article(
          affected: jsonWorldWide['cases'],
          deaths: jsonWorldWide['deaths'],
          recovered: jsonWorldWide['recovered'],
          active: jsonWorldWide['active'],
          tdydeaths: jsonWorldWide['todayDeaths'],
          tdycases: jsonWorldWide['todayCases'],
          tests: jsonWorldWide['tests'],
        );
        return art;
      } catch (err) {
        throw err.toString();
      }
    } else {
      try {
        String worldWideUrl =
            'https://corona.lmao.ninja/v3/covid-19/countries/$name';
        http.Response response = await http.get(worldWideUrl);
        if (response.statusCode == 200) {
          jsonWorldWide = convert.jsonDecode(response.body);
        } else {
          print('Request failed with status: ${response.statusCode}.');
        }
        Article art = new Article(
          affected: jsonWorldWide['cases'],
          deaths: jsonWorldWide['deaths'],
          recovered: jsonWorldWide['recovered'],
          active: jsonWorldWide['active'],
          tdydeaths: jsonWorldWide['todayDeaths'],
          tdycases: jsonWorldWide['todayCases'],
          tests: jsonWorldWide['tests'],
        );
        return art;
      } catch (err) {
        throw err.toString();
      }
    }
  }
}
