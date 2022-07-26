import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_full/models/apple_model.dart';

class RemoteAppleService {
  static var client = http.Client();
  static Future<List<Article>?> getAppleNews() async {
    var response = await client.get((Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2022-07-19&to=2022-07-19&sortBy=popularity&apiKey=c89c4af8767e48098bc40954548b0f40')));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
