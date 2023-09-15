import 'package:flutter/material.dart';
import 'package:news_app_hti/data/api_manager.dart';
import 'package:news_app_hti/model/articles_response.dart';
import 'package:news_app_hti/ui/screens/home/tabs/news_tab/article_widget.dart';

import '../../../../../model/sources_response.dart';

class ArticlesList extends StatelessWidget {
  Source source;
  ArticlesList(this.source);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlesResponse>(
        future: ApiManager.getArticles(source.id!),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }else if(snapshot.hasData){
            return buildArticlesList(snapshot.data!.articles!);
          }else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
  Widget buildArticlesList(List<Article> articles){
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticleWidget(articles[index]);
        }
    );
  }
}
