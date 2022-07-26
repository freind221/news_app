import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_full/models/news_model.dart';

class RemoteService {
  static var client = http.Client();
  static Future<List<Articles>?> getArticles() async {
    var response = await client.get((Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c89c4af8767e48098bc40954548b0f40')));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Articles> articles =
          body.map((dynamic item) => Articles.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
