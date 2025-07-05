import 'package:news/Modal/SourceResponse.dart';
import 'package:news/Repository/Source/Source-dateSource/Remote/SourceRemoteDataSource.dart';
import 'package:news/Repository/Source/Source-dateSource/offline/SourceOfflineDataSource.dart';

import 'SourceRepository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource remoteDataSource;
  // SourceOfflineDataSource sourceOfflineDataSource;
  SourceRepositoryImpl({required this.remoteDataSource });

  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
   return remoteDataSource.getSources(categoryId);
  }

}