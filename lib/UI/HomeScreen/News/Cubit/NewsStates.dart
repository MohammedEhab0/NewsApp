import '../../../../Modal/NewsResponse.dart';

abstract class NewsState{}
class NewsLoadingState extends NewsState{}
class NewsErrorState extends NewsState{
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsState{
  List<News> newsList ;
  NewsSuccessState({required this.newsList});
}
class UpdateNewsSuccessState extends NewsState{
  List<News> newsList ;
  UpdateNewsSuccessState({required this.newsList});
}
class ChangeSourceSelectedIndex extends NewsState {
  List<News> newsList ;
  ChangeSourceSelectedIndex({required this.newsList});
}