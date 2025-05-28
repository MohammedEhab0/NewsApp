import 'package:news/Repository/News/NewsRemoteDataSource/NewsRemoteDataSource.dart';
import 'package:news/Repository/News/NewsRepository/NewsRepository.dart';
import 'package:news/Repository/Source/Source-Repository/SourceRepository-Impl.dart';
import 'package:news/Repository/Source/Source-Repository/SourceRepository.dart';
import 'package:news/Repository/Source/Source-dateSource/SourceRemoteDataSource-Impl.dart';
import 'package:news/Repository/Source/Source-dateSource/SourceRemoteDataSource.dart';
import 'package:news/api/api_manager/api_manager.dart';

import '../Repository/News/NewsRemoteDataSource/NewsRemoteDataSource-Impl.dart';
import '../Repository/News/NewsRepository/NewsRepositoryImpl.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(remoteDataSource: injectSourceRemoteDataSource());
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}
ApiManager injectApiManager(){
  return ApiManager();
}
NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl( newsRemoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
