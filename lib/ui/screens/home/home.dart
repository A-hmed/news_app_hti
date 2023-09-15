import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app_hti/model/category_dm.dart';
import 'package:news_app_hti/ui/screens/home/tabs/category_tab/categories_tab.dart';
import 'package:news_app_hti/ui/screens/home/tabs/news_tab/news_tab.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryDM? categoryDM;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App!"),
        actions: [
          Icon(Icons.search),
        ],
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
      ),
      body: categoryDM == null ? CategoriesTab(setCategoryDM) : NewsTab(categoryDM!),
    );
  }

  void setCategoryDM(CategoryDM newCategory){
    categoryDM = newCategory;
    setState(() {});

  }
}
