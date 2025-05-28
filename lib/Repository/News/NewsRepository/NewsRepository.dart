import 'package:news/Modal/NewsResponse.dart';

abstract class NewsRepository {
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageNum);
}