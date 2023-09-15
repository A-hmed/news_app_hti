import 'package:flutter/material.dart';
import 'package:news_app_hti/data/api_manager.dart';
import 'package:news_app_hti/model/sources_response.dart';

class TabsViewModel extends ChangeNotifier{
  int currentTab = 0;
  List<Source> sources = [];
  String errorMessage = "";
  bool isLoading = false;

  void getSources(String categoryId){
    isLoading = true;
    notifyListeners();
   Future<SourcesResponse> sourcesResponseFuture = ApiManager.getSources(categoryId);
   sourcesResponseFuture.then((response) {
      isLoading = false;
      if(response.message == null){
        sources = response.sources ?? [];
      }else{
        errorMessage = response.message!;
      }
      notifyListeners();
    }
   ).onError((error, stackTrace) {
     isLoading = false;
     errorMessage = error.toString();
     notifyListeners();
   });
  }
}