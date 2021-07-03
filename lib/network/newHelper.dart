import 'package:dio/dio.dart';
import 'package:pageview_with_newsapi/model/news_model.dart';

class NewsHelper {
  final newsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=2d5e2245aa3e4ea0b856ffdafe43e506';

  Future<News> callNewAPI() async {
    News news;
    Response response = await Dio().get(
      newsUrl,
    );
    if (response.statusCode == 200) {
      news = newsFromJson(response.toString());
    }
    return news;
  }
}
