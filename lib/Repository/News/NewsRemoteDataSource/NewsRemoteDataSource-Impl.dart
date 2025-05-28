 import 'package:news/Modal/NewsResponse.dart';
import 'package:news/Repository/News/NewsRemoteDataSource/NewsRemoteDataSource.dart';
import 'package:news/api/api_manager/api_manager.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId (String sourceId, String pageNum) async{
   var response= await apiManager.getNewsBySourceId(sourceId, pageNum);
   return response;
  }
}