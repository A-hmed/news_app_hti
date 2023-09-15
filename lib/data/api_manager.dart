import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_hti/model/articles_response.dart';
import 'package:news_app_hti/model/sources_response.dart';

abstract class ApiManager{
  static const String baseUrl = "https://newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String everyThingEndPoint = "/v2/everything";
  static const String apiKey = "a2803275cc264f5ab82151862011361a";

  static Future<SourcesResponse> getSources(String category) async{
      http.Response response =
      await http.get(Uri.parse("$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$category"));

      SourcesResponse sourcesResponse =
      SourcesResponse.fromJson(jsonDecode(response.body));

      if(response.statusCode >= 200 && response.statusCode < 300){
      return sourcesResponse;
    }else {
        throw Exception(sourcesResponse.message??"Something went wrong please try again later");
      }
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
     http.Response response =
         await http.get(Uri.https("newsapi.org",everyThingEndPoint, {
            "apiKey": apiKey,
            "sources": sourceId}));
     ArticlesResponse articlesResponse =
     ArticlesResponse.fromJson(jsonDecode(response.body));
     if(response.statusCode >= 200 && response.statusCode < 300){
       return articlesResponse;
     }else {
       throw Exception(articlesResponse.message?? "Something went wrong please try again later");
     }
  }
}