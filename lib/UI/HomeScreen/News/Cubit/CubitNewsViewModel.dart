import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Repository/News/NewsRemoteDataSource/NewsRemoteDataSource-Impl.dart';
import 'package:news/Repository/News/NewsRepository/NewsRepositoryImpl.dart';
import 'package:news/UI/HomeScreen/News/Cubit/NewsStates.dart';
import 'package:news/api/api_manager/api_manager.dart';
import '../../../../Modal/NewsResponse.dart';
import '../../../../Repository/News/NewsRemoteDataSource/NewsRemoteDataSource.dart';
import '../../../../Repository/News/NewsRepository/NewsRepository.dart';

class CubitNewsViewModel extends Cubit<NewsState> {
 NewsRepository newsRepository;

  CubitNewsViewModel({required this.newsRepository}) : super(NewsLoadingState()){

  }

  String selectedPageNumber = "1";
  int selectedIndex = 0;
  List<News> newsList = [];

  Future<void> getNews(String sourceId, String pageNum) async {
    emit(NewsLoadingState());
    try {
      var response = await newsRepository.getNewsBySourceId(sourceId, pageNum);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      } else if (response?.status == 'ok') {
        newsList = response!.articles!;
        emit(NewsSuccessState(newsList: newsList));
        selectedPageNumber = (int.parse(selectedPageNumber) + 1).toString();
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> updateNews(String sourceId, String pageNum) async {
    emit(NewsLoadingState());
    try {
      var response = await newsRepository.getNewsBySourceId(sourceId, pageNum);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      } else if (response?.status == 'ok') {
        newsList.addAll(response!.articles!);
        emit(UpdateNewsSuccessState(newsList: newsList));
        selectedPageNumber = (int.parse(selectedPageNumber) + 1).toString();
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }

}