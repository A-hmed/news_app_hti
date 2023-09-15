import 'package:flutter/material.dart';
import 'package:news_app_hti/data/api_manager.dart';
import 'package:news_app_hti/model/category_dm.dart';
import 'package:news_app_hti/model/sources_response.dart';
import 'package:news_app_hti/ui/screens/home/tabs/news_tab/articles_list.dart';
import 'package:news_app_hti/ui/screens/home/tabs/news_tab/tabs_view_model.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  CategoryDM categoryDM;
  NewsTab(this.categoryDM);
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  TabsViewModel viewModel = TabsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      builder: (context, widget){
       viewModel = Provider.of(context);
        return  viewModel.isLoading ?
        const Center(child: CircularProgressIndicator()):
        viewModel.errorMessage.isEmpty ? buildTabsWidgets(viewModel.sources):
        Center(child: Text(viewModel.errorMessage));
      },
    );

  }

  Widget buildTabsWidgets(List<Source> sources){
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            SizedBox(height: 8,),
            TabBar(
              onTap: (index){
                viewModel.currentTab = index;
                setState(() {});
              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: sources.map(
                    (source) => buildTabWidget(source,
                        viewModel.currentTab == sources.indexOf(source))
            ).toList()),
            Expanded(
                child: TabBarView(
                    children: sources.map(
                            (source) => ArticlesList(source)
                    ).toList()))
          ],
        )
    );
  }

  Widget buildTabWidget(Source source, bool isSelected){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
       borderRadius: BorderRadius.circular(16),
        color: isSelected ?Colors.blue: Colors.white
      ),
      child: Text(source.name??"",
        style: TextStyle(color: isSelected? Colors.white: Colors.blue),),
    );
  }
}
