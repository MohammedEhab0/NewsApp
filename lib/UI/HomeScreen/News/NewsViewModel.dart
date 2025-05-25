import 'package:flutter/material.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../../../Modal/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
  String? errorMessage;
  List<News>? newsList ;

  void getNews(String sourceId,String pageNum)async{
    errorMessage=null;
    newsList=null;
    notifyListeners();
    try{
      var response=await ApiManager.getNewsBySourceId(sourceId,pageNum);
      if(response?.status == 'error'){
        errorMessage = response!.message;
      }else{
        newsList=response!.articles;
      }
    }catch(e){
      errorMessage='Error Loading News List';

    }
    notifyListeners();
  }
}