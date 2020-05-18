import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/article.dart';
import '../models/chart.dart';

class ApiService {
  var jsonWorldWide;
  var jsonData;

  Future<List<Chart>> get fetchChart async {
    try {
      String history = 'https://disease.sh/v2/historical/all?lastdays=8';
      List<dynamic> cases = [];
      List<dynamic> dates = [];
      List<Chart> data = [];

      http.Response response = await http.get(history);
      if (response.statusCode == 200) {
        jsonData = convert.jsonDecode(response.body);
        cases = jsonData['cases'].values.toList();
        dates = jsonData['cases'].keys.toList();

        for (var i = 0; i < cases.length; i++) {
          Chart c = new Chart(cases[i], dates[i].toString());
          data.add(c);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Chart>> get fetchChart2 async {
    try {
      String history = 'https://disease.sh/v2/historical/all?lastdays=8';
      List<dynamic> cases = [];
      List<dynamic> dates = [];
      List<Chart> data = [];

      http.Response response = await http.get(history);
      if (response.statusCode == 200) {
        jsonData = convert.jsonDecode(response.body);
        cases = jsonData['deaths'].values.toList();
        dates = jsonData['deaths'].keys.toList();

        for (var i = 0; i < cases.length; i++) {
          Chart c = new Chart(cases[i], dates[i].toString());
          data.add(c);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<Chart>> get fetchChart3 async {
    try {
      String history = 'https://disease.sh/v2/historical/all?lastdays=8';
      List<dynamic> cases = [];
      List<dynamic> dates = [];
      List<Chart> data = [];

      http.Response response = await http.get(history);
      if (response.statusCode == 200) {
        jsonData = convert.jsonDecode(response.body);
        cases = jsonData['recovered'].values.toList();
        dates = jsonData['recovered'].keys.toList();

        for (var i = 0; i < cases.length; i++) {
          Chart c = new Chart(cases[i], dates[i].toString());
          data.add(c);
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Article> fetchArticles(bool choise) async {
    if (choise) {
      try {
        String worldWideUrl = 'https://corona.lmao.ninja/v2/all';
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
        String worldWideUrl = 'https://corona.lmao.ninja/v2/countries/Algeria';
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
