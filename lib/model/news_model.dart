// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.source,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  Source source;
  String title;
  String description;
  String url;
  String urlToImage;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
      };
}

class Source {
  Source({
    this.name,
  });
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
