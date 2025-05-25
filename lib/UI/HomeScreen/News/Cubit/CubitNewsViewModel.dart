import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/UI/HomeScreen/News/Cubit/NewsStates.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../../../../Modal/NewsResponse.dart';

class CubitNewsViewModel extends Cubit<NewsState> {
  CubitNewsViewModel() : super(NewsLoadingState());
  String selectedPageNumber = "1";
  int selectedIndex = 0;
   List<News> newsList=[] ;
  getNews(String sourceId,String pageNum) async {
    emit(NewsLoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId,pageNum);
      if (response?.status == 'error') {
        print(response!.message!);
        emit(NewsErrorState(errorMessage: response!.message!));

        return;
      } else if (response?.status == 'ok') {
        newsList.addAll(response!.articles!);
        emit(NewsSuccessState(newsList: newsList));
        selectedPageNumber=(int.parse(selectedPageNumber) + 1).toString();
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
  updateNews(String sourceId,String pageNum) async {
    emit(NewsLoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId,pageNum);
      if (response?.status == 'error') {
        print(response!.message!);
        emit(NewsErrorState(errorMessage: response!.message!));

        return;
      } else if (response?.status == 'ok') {
        newsList.addAll(response!.articles!);
        emit(UpdateNewsSuccessState(newsList: newsList));
        selectedPageNumber=(int.parse(selectedPageNumber) + 1).toString();
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
  changeSelectedIndex({ required int newIndex,required String sourceId,required String pageNum}) async{
    selectedIndex = newIndex;
    emit(NewsLoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId,pageNum);
      if (response?.status == 'error') {
        print(response!.message!);
        emit(NewsErrorState(errorMessage: response!.message!));

        return;
      } else if (response?.status == 'ok') {
        newsList.addAll(response!.articles!);
        emit(ChangeSourceSelectedIndex(newsList: newsList));
        selectedPageNumber=(int.parse(selectedPageNumber) + 1).toString();
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
