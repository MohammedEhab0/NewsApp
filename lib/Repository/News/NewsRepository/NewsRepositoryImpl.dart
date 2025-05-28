import 'package:news/Modal/NewsResponse.dart';
import 'package:news/Repository/News/NewsRemoteDataSource/NewsRemoteDataSource.dart';

import 'NewsRepository.dart';

class NewsRepositoryImpl implements NewsRepository{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageNum) {
   return newsRemoteDataSource.getNewsBySourceId(sourceId, pageNum);

  }
}