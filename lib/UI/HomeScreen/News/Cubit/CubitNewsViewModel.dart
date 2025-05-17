import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/UI/HomeScreen/News/Cubit/NewsStates.dart';
import 'package:news/api/api_manager/api_manager.dart';

class CubitNewsViewModel extends Cubit<NewsState> {
  CubitNewsViewModel() : super(NewsLoadingState());

  getNews(String sourceId) async {
    emit(NewsLoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      } else if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
