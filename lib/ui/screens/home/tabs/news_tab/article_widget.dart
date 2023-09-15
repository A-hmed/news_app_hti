import 'package:flutter/material.dart';
import 'package:news_app_hti/model/articles_response.dart';
import 'package:news_app_hti/ui/utils/app_colors.dart';
import 'package:news_app_hti/ui/utils/constants.dart';

class ArticleWidget extends StatelessWidget {
  Article article;
  ArticleWidget(this.article);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(article.publishedAt??"").toUtc();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const CircularProgressIndicator(),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(article.urlToImage??Constants.imagePlaceHolderUrl,
                   height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                   ),
              ),
            ],
          ),
          SizedBox(height: 4,),
          Text(article.source?.name??"",
           textAlign: TextAlign.start,
           style: TextStyle(color: AppColors.newsTitle, fontSize: 10),),
          SizedBox(height: 4,),
          Text(article.description??"", textAlign: TextAlign.start,
            style: const TextStyle(color: AppColors.darkBlue, fontSize: 14,
                 fontWeight: FontWeight.w500),
            maxLines: 2,),
          SizedBox(height: 4,),
          Text("${time.day}/ ${time.month}/ ${time.year}",
            textAlign: TextAlign.end,
              style: const TextStyle(color: AppColors.darkBlue, fontSize: 13))
      ],
      ),
    );
  }
}
