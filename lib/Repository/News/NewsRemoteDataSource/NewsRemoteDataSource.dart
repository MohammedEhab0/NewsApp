import '../../../Modal/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageNum);

}