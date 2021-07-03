import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:pageview_with_newsapi/model/news_model.dart';

class NewsHelper {
  final token = "2d5e2245aa3e4ea0b856ffdafe43e506";
  final baseUrl = 'https://newsapi.org/v2/top-headlines';

  BaseOptions _baseOption() {
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Map<String, String> query = {'country': 'us'};
    return BaseOptions(
        baseUrl: baseUrl, headers: headers, queryParameters: query);
  }

  Future<News> callNewAPI() async {
    News news;
    Response response = await Dio(_baseOption()).get(
      baseUrl,
    );
    if (response.statusCode == 200) {
      news = newsFromJson(response.toString());
    }
    return news;
  }
}
