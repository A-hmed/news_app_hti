import 'package:news_app_hti/model/sources_response.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? message;
  String? code;

  ArticlesResponse({
      this.status, 
      this.totalResults, 
      this.articles});

  ArticlesResponse.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    code = json["code"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }


}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content});

  Article.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }
}
